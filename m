From: John Voltz <john.voltz@gmail.com>
Date: Mon, 5 May 2008 21:55:58 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	atngw100 atngw100-base atngw100-expanded etc...
In-Reply-To: <20080506013810.213FE3C6D4@busybox.net>
References: <20080506013810.213FE3C6D4@busybox.net>
Message-ID: <46a136670805051855v20cfee30o267907b605f6bc9a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ftp site seems to be out-of-date. The latest avr32 patches for gcc are
for version 4.2.2 with atmel patch 1.0.8. I'm not sure about the others
though. Also, they don't seem to be patched with the other uClibc patches as
well, and there is no facility in buildroot to patch the pre-patched files
either, as gcc 4.2.2 doesn't even have a toolchain directory. I've got
pre-patched sources here: ftp://64.31.81.93 that includes avr32-atmel.1.0.8
and all of the other uClibc patches as well. If you want to move them to the
at91 site that would be great. A couple of us AVR32 users have been
discussing the patch.avr32 scheme, is this out of the question?

Regards,
John Voltz


On Mon, May 5, 2008 at 9:38 PM, <ulf@uclibc.org> wrote:

> Author: ulf
> Date: 2008-05-05 18:38:09 -0700 (Mon, 05 May 2008)
> New Revision: 21936
>
> Log:
> Update BR2_ATMEL_MIRROR in defconfigs
>
> Added:
>   trunk/buildroot/target/device/Atmel/atstk100x/atstk100x_defconfig
>
> Removed:
>   trunk/buildroot/target/device/Atmel/atstk100x/atstk1002_defconfig
>
> Modified:
>
> trunk/buildroot/target/device/Atmel/atngw100-base/atngw100-base_defconfig
>
> trunk/buildroot/target/device/Atmel/atngw100-expanded/atngw100_expanded_defconfig
>   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
>
> trunk/buildroot/target/device/Atmel/atstk100x/atstk1002-no-mplayer_defconfig
>
>
> Changeset:
>
> Sorry, the patch is too large to include (1940 lines).
> Please use ViewCVS to see it!
>
> http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21936
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080505/c3782ed6/attachment-0001.htm 
