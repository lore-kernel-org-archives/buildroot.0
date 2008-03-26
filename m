From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 26 Mar 2008 21:50:25 +0100
Subject: [Buildroot] build problems
References: <1CD05B980C94AC408B37C82BBABAA3E60ACA820D@mtsexchange.dc.multitech.prv>
Message-ID: <032401c88f86$e0589330$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> -----Original Message-----
>> From: Ulf Samuelsson [mailto:ulf.samuelsson at atmel.com] 
>> Sent: Tuesday, March 25, 2008 5:42 PM
>> To: Tim Barr; Buildroot List
>> Subject: Re: [Buildroot] build problems
>> 
>> 
>> Yes, but your development would be much easier if you got 
>> a few free samples of an AT45DCB008D Dataflashcard.
>> 
> Only one possible problem I see with this. Looking at the 9260EK board,
> there is a 0 ohm resistor(R42) connecting SPI0_CLK and MCCLK. I am
> assuming this is there so that a DataFlash Card can be read from the SD
> card slot. This also means that SPI0 has to be disabled after boot if
> you want to use the SD card slot for SD cards. So if I want to be able
> to us the SPI port for other devices, I have to remove that resistor
> which makes the DataFlash card interface useless.

Yes, there is an even more severe problem.
If you have an SD-Card inserted in the slot, it will be problematic
inserting a dataflash card at the same time ;-)


Best Regards
Ulf Samuelsson 
