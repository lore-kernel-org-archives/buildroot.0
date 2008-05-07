From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 7 May 2008 14:18:30 +0200
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel:atngw100 atngw100-base
	atngw100-expanded etc...
References: <20080506013810.213FE3C6D4@busybox.net>
	<46a136670805051855v20cfee30o267907b605f6bc9a@mail.gmail.com>
Message-ID: <054a01c8b03c$79deccb0$060514ac@atmel.com>
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
> at91 site that would be great. A couple of us AVR32 users have been
> discussing the patch.avr32 scheme, is this out of the question?
> 
> Regards,
> John Voltz
> 

The Atmel stuff is uploaded, as mentioned in another email
Your patches are not included, so I am also uploading your gcc-4.2.2/4.2.3 with
the addition of the -uclibc extension (and removal of ".atmel").

Additional patches can be added in appropriate directories under 
"target/device/Atmel/toolchain".
If someone wants to move them to the "toolchain" tree,
that is OK with me.

Maybe "toolchain/gcc/4.2.2" has to be added as well.


Best Regards
Ulf Samuelsson
