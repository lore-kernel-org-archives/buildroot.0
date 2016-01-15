From: David Picard <davepiq@yahoo.fr>
Date: Fri, 15 Jan 2016 14:06:10 +0100
Subject: [Buildroot] SPI module on Raspberry Pi B+
Message-ID: <5698EEC2.7030806@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I just switched from Buildroot 2015.08.1 to 2015.11.1, and tried to keep 
the same configuration. SPI was working well, before the switch.

Now, I am having some trouble with the SPI driver, namely spi_bcm2835 : 
when I insert the module, there is no log in dmesg output, and nothing 
is created in /sys/bus/spi/devices.

I could make it work by loading spi_bcm2708 instead, despite the 
deprecated warning. In this case, I get some logging messages and 
/sys/bus/spi/devices/spi0.0 and /sys/bus/spi/devices/spi0.1 appear.

Any idea ?

David.

------------------
Board : Raspberry Pi B+
Buildroot : 2015.11.1
SPI peripheral : Adafruit PiTFT 2.8"
