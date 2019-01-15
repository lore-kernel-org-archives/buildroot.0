From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 21:15:50 +0100
Subject: [Buildroot] [git commit] package/grep: bump to version 3.3
Message-ID: <20190115201534.6412B8D4BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6beef16b63094ebf8fab56c80f83e9b3535df04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license file hash; URLs changed from http to https.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grep/grep.hash | 7 ++++---
 package/grep/grep.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 10a5e320e4..4aa7b4ecb8 100644
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
index 730f36a344..96685b0276 100644
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
