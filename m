From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2020 23:11:03 +0100
Subject: [Buildroot] [PATCH 1/2] package/binutils: disable binutils >=
 2.33.1 for configurations using BR2_BINFMT_FLAT
In-Reply-To: <20200227221922.8080-1-romain.naour@smile.fr> (Romain Naour's
 message of "Thu, 27 Feb 2020 23:19:21 +0100")
References: <20200227221922.8080-1-romain.naour@smile.fr>
Message-ID: <87lfoie7bc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > The patch added by [1] to fix a segfault with elf2flt when binutils
 > 2.33.1 is used on ARM, introduce a regression with previous binutils
 > version on m68k and ARM.

 > Theses issues has been reported upstreme [2] [3].

 > For now, disable binutils >= 2.33.1 for configurations using
 > BR2_BINFMT_FLAT.

 > [1] 2b064f86b6a0fd683f307b51f12d9d919fcaa386
 > [2] https://github.com/uclinux-dev/elf2flt/pull/16
 > [3] https://github.com/uclinux-dev/elf2flt/issues/12

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
