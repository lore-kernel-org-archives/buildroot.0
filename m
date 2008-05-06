From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 6 May 2008 13:03:54 +0200
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel:atngw100 atngw100-base
	atngw100-expanded etc...
References: <20080506013810.213FE3C6D4@busybox.net>
	<46a136670805051855v20cfee30o267907b605f6bc9a@mail.gmail.com>
Message-ID: <008e01c8af69$830eef00$5e8d910a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> The ftp site seems to be out-of-date. The latest avr32 patches for gcc are
> for version 4.2.2 with atmel patch 1.0.8. I'm not sure about the others
> though. Also, they don't seem to be patched with the other uClibc patches as
> well, and there is no facility in buildroot to patch the pre-patched files
> either, as gcc 4.2.2 doesn't even have a toolchain directory. I've got
> pre-patched sources here: ftp://64.31.81.93 that includes avr32-atmel.1.0.8
> and all of the other uClibc patches as well. If you want to move them to the
> at91 site that would be great. 

I will move this later this week.

> A couple of us AVR32 users have been
> discussing the patch.avr32 scheme, is this out of the question?

What is the benefit?
You can add patches to the AVR32 prepatched toolchain at "target/device/Atmel/toolchain"
Just need to add the correct directories.

The drawback of having patches inside the svn is that everyone not
using AVR32 will have to suffer the additional download.

> Regards,
> John Voltz



Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
