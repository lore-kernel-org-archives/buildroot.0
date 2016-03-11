From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 09:04:55 -0300
Subject: [Buildroot] [PATCH] grep: bump to version 2.24
Message-ID: <1457697895-24114-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.4.10
