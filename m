From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 10 Dec 2014 16:03:34 +0000
Subject: [Buildroot] [PATCH] barebox: bump to version 2014.12.0
In-Reply-To: <1418196753-5252-1-git-send-email-fabio.porcedda@gmail.com>
References: <1418196753-5252-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <54886ED6.6040405@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

built for MIPS using the img-ci20 defconfig.

$ grep SOURCERY .config
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411=y
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405 is not set
# BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311 is not set

$ grep BAREBOX_VERSION .config
BR2_TARGET_BAREBOX_VERSION="2014.12.0"

$ ls output/images/
barebox.bin  rootfs.tar

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
