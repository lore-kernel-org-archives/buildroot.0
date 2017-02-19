From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 19 Feb 2017 23:54:20 +0100
Subject: [Buildroot] [PATCH] package/quazip: update to 0.7.3
Message-ID: <1487544860-10947-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/quazip/quazip.hash | 2 +-
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 2f73c45..87bf7c2 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 91d827fbcafd099ae814cc18a8dd3bb709da6b8a27c918ee1c6c03b3f29440f4 quazip-0.7.2.tar.gz
+sha256 2ad4f354746e8260d46036cde1496c223ec79765041ea28eb920ced015e269b5 quazip-0.7.3.tar.gz
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 91b2f56..caf112e 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 0.7.2
+QUAZIP_VERSION = 0.7.3
 QUAZIP_SITE = http://sourceforge.net/projects/quazip/files/quazip/$(QUAZIP_VERSION)
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
-- 
2.7.4
