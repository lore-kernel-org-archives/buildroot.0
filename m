From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Mar 2016 23:16:11 +0100
Subject: [Buildroot] [git commit] grep: bump to version 2.24
Message-ID: <20160313221829.E4CDC81861@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9eee5d95fa66c6baf033bbd821dd5ae382bd2b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grep/grep.hash | 2 +-
 package/grep/grep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 5c49da2..ec8e45b 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256	54fc478ee1ce17780109820ef30730c9e18715a949f7d5c6afc673adb2a56ecf	grep-2.23.tar.xz
+sha256	f248beb9098c5aab94d2fdd03b5a21d705e5ba8a3ce4d8c9f607a670498eec14	grep-2.24.tar.xz
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 65ef469..527c17d 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.23
+GREP_VERSION = 2.24
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
