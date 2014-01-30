From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Thu, 30 Jan 2014 14:45:41 +0100
Subject: [Buildroot] udev and serial port
In-Reply-To: <52E8DB08.8060107@mind.be>
References: <52E4FA8C.7060109@gmail.com>	<52E6945C.40202@mind.be>	<52E8120F.7080805@gmail.com>	<20140128230904.1f01a5dc@skate>	<52E8AA41.1020709@mind.be>
 <20140129093013.5ca63190@skate> <52E8DB08.8060107@mind.be>
Message-ID: <52EA5785.5050507@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
in my buildroot environment I have udev enabled. I need to connect some 
UART-to-USB converter based upon FTDI chip (I added the libftdi in the 
config).

When I plug-in the converter to my target dmesg see the new hardware but 
I can't see any /dev/ttyUSB device.

Do I need to add something other in the configuration?
Where should I search information about this "how-to"?

Thanks
Marco
