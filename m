From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 14 Jun 2020 17:45:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: bump to version 1.9.0
Message-ID: <20200614154557.3415092-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ChangeLog:
- SCardEndTransaction(): greatly improve performances (x300)
- tokenparser: accept any Unicode character in a reader name
- Use /run instead of /var/run by default
- Fix a memory leak from a polkit call
- Some other minor improvements

Also update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pcsc-lite/pcsc-lite.hash | 6 +++---
 package/pcsc-lite/pcsc-lite.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 5df6a93582..08bc85b154 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 3eb7be7d6ef618c0a444316cf5c1f2f9d7227aedba7a192f389fe3e7c0dfbbd9  pcsc-lite-1.8.26.tar.bz2
-sha256 40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
+sha256  0148d403137124552c5d0f10f8cdab2cbb8dfc7c6ce75e018faf667be34f2ef9  pcsc-lite-1.9.0.tar.bz2
+sha256  40d4358bb8dc8d30f5365ae6d999b6f820bbc051b292912482f2e4d0ebd837e1  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-3.0.txt
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index 96fa3f937a..c411e9c7ee 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.8.26
+PCSC_LITE_VERSION = 1.9.0
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = https://pcsclite.apdu.fr/files
 PCSC_LITE_INSTALL_STAGING = YES
-- 
2.26.2
