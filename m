From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 29 Jan 2014 12:06:55 +0100
Subject: [Buildroot] [PATCH] defconfig for Phytec Cosmic-AM335x Board
In-Reply-To: <52E8B383.5050406@mind.be> (Arnout Vandecappelle's message of
 "Wed, 29 Jan 2014 08:53:39 +0100")
References: <1390908698-7256-1-git-send-email-praveen.v@phytec.in>
 <87lhxzzrj3.fsf@dell.be.48ers.dk> <52E8B383.5050406@mind.be>
Message-ID: <87ha8nvygg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> > +To boot the board you need MLO (primary bootloader) so download from below link
 >> > +ftp://ftp.phytec.de/pub/Products/India/Cosmic-AM335x/Linux/PD13.0.0/images/MLO
 >> 
 >> Hmm, can't we build MLO ourselves?

 >  The patch that makes that possible in barebox was just rejected in
 > patchwork...

Ahh, ok. I don't personally use barebox, but if people need this then
presumably the patch can be resurrected.

 >> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
 >> > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="ftp://ftp.phytec.de/pub/Products/India/Cosmic-AM335x/Linux/PD13.0.0/src/linux/linux-3.2.tar.bz2"
 >> 
 >> No mainline support?

 >  3.2 so still using board files...

Yeah. I don't think there's much need to stay at 3.2 for am335x nowadays
though.

-- 
Bye, Peter Korsgaard
