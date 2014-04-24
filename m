From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Apr 2014 23:12:19 +0200
Subject: [Buildroot] [PATCH v3] ne10: bump version to 1.0.0
In-Reply-To: <748fce948e11980e6f5e0ed3a796c1c0b0d2b8bc.1398248206.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 23 Apr 2014 13:16:46 +0300")
References: <748fce948e11980e6f5e0ed3a796c1c0b0d2b8bc.1398248206.git.baruch@tkos.co.il>
Message-ID: <874n1i1lfw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Switch to github helper while at it.
 > Depend on BR2_ARM_FPU_NEON || BR2_ARM_FPU_NEON_VFPV4 so that the toolchain
 > wrapper will add -mfpu=neon, and avoid the following error:

 > .../include/arm_neon.h:32:2: error: #error You must enable NEON instructions (e.g. -mfloat-abi=softfp -mfpu=neon) to use arm_neon.h

 > Note that this error doesn't show in the build-end.log referenced below
 > because of the log lines limit.

 > Fixes:
 > http://autobuild.buildroot.net/results/a2c/a2ca3fe245e410a738f4b10631a1414696a0edea/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
