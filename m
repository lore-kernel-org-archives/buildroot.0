From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 16 Nov 2016 17:40:10 +0000
Subject: [Buildroot] [PATCH next] lftp: bump version to 4.7.4
Message-ID: <20161116174010.11273-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lftp/lftp.hash | 4 ++--
 package/lftp/lftp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index 57a5205..0e0f927 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 3b22259cdc4c1a6ae349057d16bda4b4816929e04d223242ab8927bc31a48e7c  lftp-4.7.3.tar.xz
+# Locally calculated after checking gpg signature
+sha256 bf67c4d128b6f769a4082947376a9679c5ee3463a24ab761a0757f75d70bd92c  lftp-4.7.4.tar.xz
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 802bbc7..a7e1f92 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.7.3
+LFTP_VERSION = 4.7.4
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
-- 
2.10.1
