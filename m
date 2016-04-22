From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 22 Apr 2016 10:11:19 -0300
Subject: [Buildroot] [PATCH] grep: bump to version 2.25
Message-ID: <1461330679-17301-1-git-send-email-gustavo@zacarias.com.ar>
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
index ec8e45b..409940a 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256	f248beb9098c5aab94d2fdd03b5a21d705e5ba8a3ce4d8c9f607a670498eec14	grep-2.24.tar.xz
+sha256	e21e83bac50450e0d0d61a42c154ee0dceaacdbf4f604ef6e79071cb8e596830	grep-2.25.tar.xz
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 527c17d..f87e838 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.24
+GREP_VERSION = 2.25
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
-- 
2.7.3
