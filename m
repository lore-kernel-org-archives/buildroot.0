From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 24 Apr 2008 17:27:34 +0200
Subject: [Buildroot] Buildroot for AT91RM9200EK?
References: <974174.17096.qm@web31809.mail.mud.yahoo.com>
Message-ID: <022f01c8a627$20b88c80$060514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Found one issue,
[snip]
> 
> I did try and build the tool chain and UBoot for the Atmel AT91rm9260
> dev board and it built without an error.
> 
> I think this means that build root support for the Atmel AT91rm9200ek
> dev board is currently broken
> 

There is support in buildroot for AT91RM9200EK with dataflash.
You have to do "make at91rm9200dfc_defconfig"

Best Regards
Ulf Samuelsson
