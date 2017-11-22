From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:34:06 +0100
Subject: [Buildroot] [git commit branch/next] kexec-lite: Bump version
Message-ID: <20171122202644.DF38D811D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39640c94a8f266d620fc25df83b6a6392eedee17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

From this version kexec-lite gained support for FreeBSD kernel
loading.

Signed-off-by: Patryk Duda <pdk@semihalf.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kexec-lite/kexec-lite.hash | 2 +-
 package/kexec-lite/kexec-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec-lite/kexec-lite.hash b/package/kexec-lite/kexec-lite.hash
index 0f21224..d71e8d0 100644
--- a/package/kexec-lite/kexec-lite.hash
+++ b/package/kexec-lite/kexec-lite.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 5786ddc0c94ead4fd4a1fded44bb1da0c9bc91af08049fed373ea161603e1e1f  kexec-lite-86e45a47e8cc1f598ccfa9b873a23067f4ecc36f.tar.gz
+sha256 2e9b131324cec9d27840179daa35e3159a4032ff78b74e301850faa007567d0e kexec-lite-87d044a895b1c004320a2676099a54a5a2a74f2e.tar.gz
diff --git a/package/kexec-lite/kexec-lite.mk b/package/kexec-lite/kexec-lite.mk
index 76b6819..8e1ad8d 100644
--- a/package/kexec-lite/kexec-lite.mk
+++ b/package/kexec-lite/kexec-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_LITE_VERSION = 86e45a47e8cc1f598ccfa9b873a23067f4ecc36f
+KEXEC_LITE_VERSION = 87d044a895b1c004320a2676099a54a5a2a74f2e
 KEXEC_LITE_SITE = $(call github,antonblanchard,kexec-lite,$(KEXEC_LITE_VERSION))
 KEXEC_LITE_LICENSE = GPL-2.0+
 KEXEC_LITE_LICENSE_FILES = COPYING
