From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 23 Jan 2007 23:29:26 +0100
Subject: [Buildroot] [PATCH] Prepatory patch for Atmel AT91/AVR32 Target
	support
Message-ID: <1169591366.5361.3.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Have target support allowing
* Dataflashboot/at91bootstrap
* U-Boot
* Linux Kernel

This is the first patch in a series to support 
* AT91RM9200
* AT91SAM9260
* AT91SAM9261
* AT91SAM9263
* AT32AP700x

It will rearrange the taarget/Config.in in Alphapbetical order and 
create the target/device/Atmel directory with an empty Config.in

Best Regards
Ulf Samuelsson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: target_device_Config.in.patch
Type: text/x-patch
Size: 1449 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070123/fbf6f4e5/attachment.bin 
