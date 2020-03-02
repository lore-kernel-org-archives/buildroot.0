From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2020 23:11:09 +0100
Subject: [Buildroot] [PATCH 2/2] package/elf2flt: remove backported patch
In-Reply-To: <20200227221922.8080-2-romain.naour@smile.fr> (Romain Naour's
 message of "Thu, 27 Feb 2020 23:19:22 +0100")
References: <20200227221922.8080-1-romain.naour@smile.fr>
 <20200227221922.8080-2-romain.naour@smile.fr>
Message-ID: <87h7z6e7b6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > The patch added by [1] to fix a segfault with elf2flt when binutils
 > 2.33.1 is used on ARM, introduce a regression with previous binutils
 > version on m68k and ARM.

 > Theses issues has been reported upstream [2] [3] but there is no
 > definitive solution.

 > The binutils 2.33.1 has been disabled for configurations using
 > BR2_BINFMT_FLAT by the previous commit, so we can safely remove
 > the patch.

 > Fixes:
 > [acpica-20191018]
 > http://autobuild.buildroot.net/results/81ee33eb606062a62765d95b66a26f130d280c53
 > [augeas-1.12.0]
 > http://autobuild.buildroot.net/results/4e1f7f335d2c853e2a5e6ad96c14157ba8f003c7
 > [cairo-1.16.0]
 > http://autobuild.buildroot.net/results/976d99bc9b052f8d9429e666ac7fff7768ffff6b
 > [fontconfig-2.13.1]
 > http://autobuild.buildroot.net/results/4a5a8cb6411d709acb7ea8c83b3c8e45fdc0a10b
 > [gptfdisk-1.0.4]
 > http://autobuild.buildroot.net/results/6db5f9d8663730a54b04c1e624438095598b2573
 > [libopenssl-1.1.1d]
 > http://autobuild.buildroot.net/results/acf87e81130e85e7fb05edf5f6dedf095f16e226
 > [mimic-1.1.0]
 > http://autobuild.buildroot.net/results/61f53630ed85ee0d0d6dbf71012db77f4d7986ad
 > Maybe more...

 > [1] 2b064f86b6a0fd683f307b51f12d9d919fcaa386
 > [2] https://github.com/uclinux-dev/elf2flt/pull/16
 > [3] https://github.com/uclinux-dev/elf2flt/issues/12

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
