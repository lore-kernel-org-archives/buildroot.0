From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 10 Feb 2012 11:10:05 -0500
Subject: [Buildroot] [PATCH v3 directfb] directfb: font handling
	requires libbz2
In-Reply-To: <87pqdm2367.fsf@macbook.be.48ers.dk>
References: <1328826314-30424-1-git-send-email-twoerner@gmail.com>
 <1328826314-30424-2-git-send-email-twoerner@gmail.com>
 <8762ff2ekh.fsf@macbook.be.48ers.dk>
 <CAHUNapRJ_ygVDiJRZd9+F27pH2_dQOvqLXaG8UvzSt6AWZGnuQ@mail.gmail.com>
 <87pqdm2367.fsf@macbook.be.48ers.dk>
Message-ID: <CAHUNapR0j-pw8=iVv3oUbD35WQGWJL3mG7OXEOmUi0v09iCohQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Feb 10, 2012 at 9:06 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> Is this with a clean build? You must have bz2 headers/libs somewhere for
> freetype to be built with bz2 support.
>
> I just built the qemu_arm_versatile_defconfig config with directfb
> enabled and tested it in qemu without any problems.

Thanks for helping me out with this, I see the issue now: my external
toolchain contains the bz2 headers/libs in its sysroot.

Best regards,
    Trevor
