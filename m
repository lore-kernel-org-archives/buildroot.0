From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 24 Apr 2019 11:37:06 +0200
Subject: [Buildroot] [PATCH] package/sysdig: bump to version 0.25
Message-ID: <1556098626-18620-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps sysdig to version 0.25

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/sysdig/sysdig.hash | 2 +-
 package/sysdig/sysdig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index 565b1e9..c2589f3 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  57d5b713b875eba35546a1408bf3f20c2703904a17d956be115ee55272db4cfa  sysdig-0.23.1.tar.gz
+sha256  57d5b713b875eba35546a1408bf3f20c2703904a17d956be115ee55272db4cfa  sysdig-0.25.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 9ac990e..ddf1bf4 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.23.1
+SYSDIG_VERSION = 0.25
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = GPL-2.0
 SYSDIG_LICENSE_FILES = COPYING
-- 
2.7.4
