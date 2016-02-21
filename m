From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Feb 2016 22:19:28 +0100
Subject: [Buildroot] [PATCH 1/3] toolchain-external: bump Linaro AArch64
	to 2015.11-2
In-Reply-To: <1454347864-4891-1-git-send-email-romain.naour@gmail.com> (Romain
 Naour's message of "Mon, 1 Feb 2016 18:31:02 +0100")
References: <1454347864-4891-1-git-send-email-romain.naour@gmail.com>
Message-ID: <87mvqtahi7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Runtime tested with Qemu 2.3.1 using qemu_aarch64_virt_defconfig.
 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 >  toolchain/toolchain-external/Config.in               | 2 +-
 >  toolchain/toolchain-external/toolchain-external.hash | 2 +-
 >  toolchain/toolchain-external/toolchain-external.mk   | 4 ++--
 >  3 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
 > index 763d728..a873e41 100644
 > --- a/toolchain/toolchain-external/Config.in
 > +++ b/toolchain/toolchain-external/Config.in
 > @@ -543,7 +543,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 
 >  # See note about Linar ARM/ARMEB toolchains, above.
 >  config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 > -	bool "Linaro AArch64 2015.08"
 > +	bool "Linaro AArch64 2015.11"

Not related to this patch, but I see we have a typo just above (Linar
ARM/ARMEB). I'll fix that now.

-- 
Bye, Peter Korsgaard
