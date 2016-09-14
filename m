From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Sep 2016 10:08:00 -0300
Subject: [Buildroot] [PATCH] httping: bump to version 2.5
Message-ID: <1473858480-12208-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/httping/httping.hash | 2 +-
 package/httping/httping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/httping/httping.hash b/package/httping/httping.hash
index 0368f75..a50eedb 100644
--- a/package/httping/httping.hash
+++ b/package/httping/httping.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	dab59f02b08bfbbc978c005bb16d2db6fe21e1fc841fde96af3d497ddfc82084	httping-2.4.tgz
+sha256	3e895a0a6d7bd79de25a255a1376d4da88eb09c34efdd0476ab5a907e75bfaf8	httping-2.5.tgz
diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index 7e76090..3418ffa 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTTPING_VERSION = 2.4
+HTTPING_VERSION = 2.5
 HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
 HTTPING_SITE = http://www.vanheusden.com/httping
 HTTPING_LICENSE = GPLv2
-- 
2.7.3
