From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Oct 2020 08:33:42 +0200
Subject: [Buildroot] [git commit] package/grep: bump to version 3.5
Message-ID: <20201012062532.6DF5C88FD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc00a4349466a9a05cb083e8084431206a92b9c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps grep to version 3.5

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grep/grep.hash | 4 ++--
 package/grep/grep.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 47bf550a20..fae3b73e80 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# http://ftp.gnu.org/gnu/grep/grep-3.4.tar.xz.sig
+# http://ftp.gnu.org/gnu/grep/grep-3.5.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  58e6751c41a7c25bfc6e9363a41786cff3ba5709cf11d5ad903cf7cce31cc3fb  grep-3.4.tar.xz
+sha256  b82ac77707c2ab945520c8404c9fa9f890f7791a62cf2103cf6238acad87a44a  grep-3.5.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index ef1bbb4487..bdc22fa46c 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.4
+GREP_VERSION = 3.5
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
