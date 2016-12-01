From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 01 Dec 2016 22:21:41 -0000
Subject: [Buildroot] [git commit] lftp: bump version to 4.7.4
Message-ID: <20161201222137.1B4397FB56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=496b15eac07e7fc6de21360e27be1e8ed864268b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
