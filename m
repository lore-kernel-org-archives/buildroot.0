From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 30 Jun 2016 14:52:55 -0300
Subject: [Buildroot] [PATCH] xerces: security bump to version 3.1.4
Message-ID: <1467309175-9267-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-4463 - XML Parser Crashes on Malformed DTD.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xerces/xerces.hash | 4 ++--
 package/xerces/xerces.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xerces/xerces.hash b/package/xerces/xerces.hash
index 639e668..c621f5c 100644
--- a/package/xerces/xerces.hash
+++ b/package/xerces/xerces.hash
@@ -1,2 +1,2 @@
-# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.1.3.tar.xz.sha256
-sha256 d35ae442db333f73c7ef41b2ce2e33bc8aba8dbacf582af765eda26415d25c94 xerces-c-3.1.3.tar.xz
+# From http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.1.4.tar.xz.sha256
+sha256 9973cc79481803f8b6652c52faf5195d963f50d209d4f681ec97e2aa014b6241 xerces-c-3.1.4.tar.xz
diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index e7f57b3..a25641f 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XERCES_VERSION = 3.1.3
+XERCES_VERSION = 3.1.4
 XERCES_SOURCE = xerces-c-$(XERCES_VERSION).tar.xz
 XERCES_SITE = http://archive.apache.org/dist/xerces/c/3/sources
 XERCES_LICENSE = Apache-2.0
-- 
2.7.3
