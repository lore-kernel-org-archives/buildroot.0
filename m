From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 18:18:13 +0100
Subject: [Buildroot] [git commit] package/pcsc-lite: bump to version 1.9.1
Message-ID: <20210308072136.5E56188918@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a66614dddda1c2143ddbb2111f7e0ccee96be6ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/LudovicRousseau/PCSC/releases/tag/1.9.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 08bc85b154..4d31b25aaa 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0148d403137124552c5d0f10f8cdab2cbb8dfc7c6ce75e018faf667be34f2ef9  pcsc-lite-1.9.0.tar.bz2
+sha256  73c4789b7876a833a70f493cda21655dfe85689d9b7e29701c243276e55e683a  pcsc-lite-1.9.1.tar.bz2
 sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index c411e9c7ee..3091da41a4 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.9.0
+PCSC_LITE_VERSION = 1.9.1
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
