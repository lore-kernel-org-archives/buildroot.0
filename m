From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 22 May 2017 11:32:03 +0100
Subject: [Buildroot] [PATCH next] pcsc-lite: bump version to 1.8.21
Message-ID: <20170522103203.9586-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/pcsc-lite/pcsc-lite.hash | 2 +-
 package/pcsc-lite/pcsc-lite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pcsc-lite/pcsc-lite.hash b/package/pcsc-lite/pcsc-lite.hash
index 8df43a105..4a3bd6319 100644
--- a/package/pcsc-lite/pcsc-lite.hash
+++ b/package/pcsc-lite/pcsc-lite.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ec7d0114016c788c1c09859c84860f6cec6c4595436d23245105154b9c046bb2 pcsc-lite-1.8.20.tar.bz2
+sha256 ec7d0114016c788c1c09859c84860f6cec6c4595436d23245105154b9c046bb2 pcsc-lite-1.8.21.tar.bz2
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
index c6c4962ce..0fbc3b390 100644
--- a/package/pcsc-lite/pcsc-lite.mk
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCSC_LITE_VERSION = 1.8.20
+PCSC_LITE_VERSION = 1.8.21
 PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
 PCSC_LITE_SITE = http://alioth.debian.org/frs/download.php/file/4203
 PCSC_LITE_INSTALL_STAGING = YES
-- 
2.13.0
