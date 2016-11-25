From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Date: Fri, 25 Nov 2016 13:19:53 +1100
Subject: [Buildroot] [PATCH] package/kexec-lite: Update to latest version
Message-ID: <20161125021953.17593-1-sam@mendozajonas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream kexec-lite now has support for kexec on POWER9 based machines.
Update so this works in simulators and is ready for when real machines
are available.

Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
---
 package/kexec-lite/kexec-lite.hash | 2 +-
 package/kexec-lite/kexec-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec-lite/kexec-lite.hash b/package/kexec-lite/kexec-lite.hash
index e8179b7..0f21224 100644
--- a/package/kexec-lite/kexec-lite.hash
+++ b/package/kexec-lite/kexec-lite.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2300187bf25616c382cb2f191a2eb13033e019511854794ce234a76cf9f5ad6b  kexec-lite-783fb4a811d0b0f8cc2ed68fa7872dcad56a3944.tar.gz
+sha256 5786ddc0c94ead4fd4a1fded44bb1da0c9bc91af08049fed373ea161603e1e1f  kexec-lite-86e45a47e8cc1f598ccfa9b873a23067f4ecc36f.tar.gz
diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index 27bc204..2467306 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_LITE_VERSION = 783fb4a811d0b0f8cc2ed68fa7872dcad56a3944
+KEXEC_LITE_VERSION = 86e45a47e8cc1f598ccfa9b873a23067f4ecc36f
 KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
 KEXEC_LITE_LICENSE = GPLv2+
 KEXEC_LITE_DEPENDENCIES = elfutils dtc
-- 
2.10.2
