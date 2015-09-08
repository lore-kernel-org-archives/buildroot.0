From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Sep 2015 12:00:34 +0200
Subject: [Buildroot] Right board to use -- buildroot begniers
In-Reply-To: <CAKpDV8uJiT88YYY2gxNohTmQoP2toaFpWFjDSGTSaG2kENaPCg@mail.gmail.com>
References: <CAKpDV8sGQrmePsmbhrQo0YMGTLLTZb4Rsq90W3Y4nfMZTrcS+A@mail.gmail.com>
 <55EDE7A6.4060902@mind.be>
 <CAKpDV8udG2fRi8RWJbb=5nPNJ3SnYUE6dsPPmD11vnwUFzLL1A@mail.gmail.com>
 <55EE8B90.9060708@mind.be>
 <CAKpDV8uJiT88YYY2gxNohTmQoP2toaFpWFjDSGTSaG2kENaPCg@mail.gmail.com>
Message-ID: <20150908120034.513fdc29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Sep 2015 14:26:31 +0530, Dinesh Guleria wrote:

> With seggers j- link can i flash uboot to the Nand flash of this board ?

You don't need that. The Atmel SoCs have a built-in "monitor" that you
can talk to over the USB device port. It requires a tool called SAM-BA.

If you're looking at beginning with the Atmel Xplained, you can follow
the slides/labs at http://free-electrons.com/training/embedded-linux/,
this training is done on this platform, and will teach you how to build
and flash the bootloader, how to build and run a kernel, how to build
your minimal userspace, how to use Buildroot, etc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
