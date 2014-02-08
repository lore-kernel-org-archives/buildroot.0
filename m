From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Feb 2014 23:11:22 +0100
Subject: [Buildroot] [git commit] kexec: bump to 2.0.5
Message-ID: <20140208222132.3D7849C8DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ab2cb2d9be4c481a91e5b3104027d926c7784ae2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kexec/kexec.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 6ddf435..b16787c 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.4
+KEXEC_VERSION = 2.0.5
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 
