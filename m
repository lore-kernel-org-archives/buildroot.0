From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Feb 2016 21:43:49 +0100
Subject: [Buildroot] [git commit] xerces: security bump to version 3.1.3
Message-ID: <20160229204355.4BCDA803BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=327c75b0c42b2bc40269d90733d80a53e4ebaaa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2016-0729 - Apache Xerces-C XML Parser Crashes on Malformed Input

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index e57949a..b69f47c 100644
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
