From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Feb 2012 20:11:52 +0100
Subject: [Buildroot] [PATCH v3 directfb] directfb: font handling
	requires libbz2
In-Reply-To: <CAHUNapR0j-pw8=iVv3oUbD35WQGWJL3mG7OXEOmUi0v09iCohQ@mail.gmail.com>
 (Trevor Woerner's message of "Fri, 10 Feb 2012 11:10:05 -0500")
References: <1328826314-30424-1-git-send-email-twoerner@gmail.com>
 <1328826314-30424-2-git-send-email-twoerner@gmail.com>
 <8762ff2ekh.fsf@macbook.be.48ers.dk>
 <CAHUNapRJ_ygVDiJRZd9+F27pH2_dQOvqLXaG8UvzSt6AWZGnuQ@mail.gmail.com>
 <87pqdm2367.fsf@macbook.be.48ers.dk>
 <CAHUNapR0j-pw8=iVv3oUbD35WQGWJL3mG7OXEOmUi0v09iCohQ@mail.gmail.com>
Message-ID: <87lioa1p1j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trevor" == Trevor Woerner <twoerner@gmail.com> writes:

Hi,

 >> I just built the qemu_arm_versatile_defconfig config with directfb
 >> enabled and tested it in qemu without any problems.

 Trevor> Thanks for helping me out with this, I see the issue now: my external
 Trevor> toolchain contains the bz2 headers/libs in its sysroot.

Ahh ok. We only really support bare external toolchains.

-- 
Bye, Peter Korsgaard
