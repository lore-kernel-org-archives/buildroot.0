From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 15 Jan 2019 20:16:25 +0200
Subject: [Buildroot] [PATCH] package/grep: bump to version 3.3
Message-ID: <8ff37cd4ff30e97b778427a805dca6797fd8597b.1547576185.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license file hash; URLs changed from http to https.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/grep/grep.hash | 7 ++++---
 package/grep/grep.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 10a5e320e410..4aa7b4ecb834 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,4 +1,5 @@
 # Locally calculated after checking signature
-# http://ftp.gnu.org/gnu/grep/grep-3.1.tar.xz.sig
-sha256 db625c7ab3bb3ee757b3926a5cfa8d9e1c3991ad24707a83dde8a5ef2bf7a07e  grep-3.1.tar.xz
-sha256 ca372a7d92560b1fa9f6d832b440e8bcd62d9adfa8870c98287deab66d98310e  COPYING
+# http://ftp.gnu.org/gnu/grep/grep-3.3.tar.xz.sig
+# using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
+sha256 b960541c499619efd6afe1fa795402e4733c8e11ebf9fafccc0bb4bccdc5b514  grep-3.3.tar.xz
+sha256 3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 730f36a344f5..96685b0276c9 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.1
+GREP_VERSION = 3.3
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
-- 
2.20.1
