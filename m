From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Feb 2016 12:27:10 -0300
Subject: [Buildroot] [PATCH] xerces: security bump to version 3.1.3
Message-ID: <1456759630-7527-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-0729 - Apache Xerces-C XML Parser Crashes on Malformed Input

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xerces/xerces.hash | 4 ++--
 package/xerces/xerces.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
index 6f4c267..639e668 100644
--- a/package/xerces/xerces.hash
+++ b/package/xerces/xerces.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.1.2.tar.xz.sha256
-sha256 a847529ab6125f36039f54fa61f3d5043791accf7da2f43917cd2b49deb768f1 xerces-c-3.1.2.tar.xz
+# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.1.3.tar.xz.sha256
+sha256 d35ae442db333f73c7ef41b2ce2e33bc8aba8dbacf582af765eda26415d25c94 xerces-c-3.1.3.tar.xz
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index d04c406..e7f57b3 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XERCES_VERSION = 3.1.2
+XERCES_VERSION = 3.1.3
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
-- 
2.4.10
