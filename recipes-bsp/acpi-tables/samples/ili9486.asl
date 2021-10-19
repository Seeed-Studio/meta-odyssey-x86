/*
 * This ASL can be used to declare a spidev device on SPI0 CS0
 */
DefinitionBlock ("ili9486", "SSDT", 5, "ILITEK", "ILI9486", 1)
{
    External (_SB_.PCI0.SPI1, DeviceObj)

    Scope (\_SB.PCI0.SPI1)
    {
        Device (LCD0) {
            Name (_HID, "PRP0001")
            Name (_DDN, "RPI Hat LCD, wareshare")
            Name (_CRS, ResourceTemplate () {
                SpiSerialBus (
                    0,                      // Chip select
                    PolarityLow,            // Chip select is active low
                    FourWireMode,           // Full duplex
                    8,                      // Bits per word is 8 (byte)
                    ControllerInitiated,    // Don't care
                    24000000,                // 24 MHz
                    ClockPolarityLow,       // SPI mode 0
                    ClockPhaseFirst,        // SPI mode 0
                    "\\_SB.PCI0.SPI1",      // SPI host controller
                    0                       // Must be 0
                )
		  GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionOutputOnly,"\\_SB.GPO0", 0 ) { 
			70,
			38 
		}
            })
           /*
            * See Documentation/devicetree/bindings/net/ieee802154/mrf24j40.txt
            * for more information about these bindings.
            */
           Name (_DSD, Package () {
               ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
               Package () {
                   	Package () { "compatible", Package () { "ilitek,ili9486" } },
		   	Package () { "txbuflen", 32768 },
			Package () { "rotate", 90 },
			Package () { "bgr", 0 },
			Package () { "fps", 30 },
			Package () { "buswidth", 8 },
			Package () { "regwidth", 16 },
			Package () { "debug", 0 },
			Package () { "reset-gpios", Package () {^LCD0, 0, 1, 0} },
			Package () { "dc-gpios", Package () {^LCD0, 0, 0, 1} },
               }
           })
   
        }
    }
}

