From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Apr 2016 21:52:28 +0200
Subject: [Buildroot] [git commit] grep: bump to version 2.25
Message-ID: <20160422195556.780A97FFA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a8da21fbb642846d89893eb4af4f2a1c4993d0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
