From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Feb 2012 15:06:40 +0100
Subject: [Buildroot] [PATCH v3 directfb] directfb: font handling
	requires libbz2
In-Reply-To: <CAHUNapRJ_ygVDiJRZd9+F27pH2_dQOvqLXaG8UvzSt6AWZGnuQ@mail.gmail.com>
 (Trevor Woerner's message of "Fri, 10 Feb 2012 08:22:59 -0500")
References: <1328826314-30424-1-git-send-email-twoerner@gmail.com>
 <1328826314-30424-2-git-send-email-twoerner@gmail.com>
 <8762ff2ekh.fsf@macbook.be.48ers.dk>
 <CAHUNapRJ_ygVDiJRZd9+F27pH2_dQOvqLXaG8UvzSt6AWZGnuQ@mail.gmail.com>
Message-ID: <87pqdm2367.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trevor" == Trevor Woerner <twoerner@gmail.com> writes:

Hi,

 Trevor> But when I run the "df_dok" example on the target it complains (as
 Trevor> I've shown before) that libidirectfbfont_ft2.so requires libbz2:

Is this with a clean build? You must have bz2 headers/libs somewhere for
freetype to be built with bz2 support.

I just built the qemu_arm_versatile_defconfig config with directfb
enabled and tested it in qemu without any problems.

-- 
Bye, Peter Korsgaard
