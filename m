From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 15:44:44 +0200
Subject: [Buildroot] [git commit] poco: regenerate patch
 0001-poco-add-the-staging-path-to-search-path.patch
Message-ID: <20180701134417.6FD41836FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e77bafd28435c1444e02ca1c0c3d1cab9245258
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit regenerates the patch
0001-poco-add-the-staging-path-to-search-path.patch to not have
numbering.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../poco/0001-poco-add-the-staging-path-to-search-path.patch   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/poco/0001-poco-add-the-staging-path-to-search-path.patch b/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
index 5695b62618..5453cba13f 100644
--- a/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
+++ b/package/poco/0001-poco-add-the-staging-path-to-search-path.patch
@@ -1,7 +1,7 @@
-From b8417607ec8840e6a1e27cf03b6958c794a33e49 Mon Sep 17 00:00:00 2001
+From a3cb6e42fc2cfa0620ba737148fcbea0cf96a984 Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Tue, 4 Aug 2015 10:14:00 +0200
-Subject: [PATCH 1/2] poco: add the staging path to search path
+Subject: [PATCH] poco: add the staging path to search path
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -19,10 +19,10 @@ Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Data/MySQL/Makefile b/Data/MySQL/Makefile
-index 0b18ca5..094e807 100644
+index c6fc2ac1c..955fee2d4 100644
 --- a/Data/MySQL/Makefile
 +++ b/Data/MySQL/Makefile
-@@ -8,8 +8,8 @@
+@@ -6,8 +6,8 @@
  
  include $(POCO_BASE)/build/rules/global
  
@@ -34,5 +34,5 @@ index 0b18ca5..094e807 100644
  
  objects = Binder Extractor SessionImpl Connector \
 -- 
-2.5.0
+2.14.4
 
