From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 12 Aug 2018 22:43:46 +0200
Subject: [Buildroot] [PATCH 1/1] domoticz: fix appversion.default
Message-ID: <20180812204346.8978-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Retrieve correct appversion.default (9700) from upstream

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/0001-Bumped-version.patch | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 package/domoticz/0001-Bumped-version.patch

diff --git a/package/domoticz/0001-Bumped-version.patch b/package/domoticz/0001-Bumped-version.patch
new file mode 100644
index 0000000000..70426ba1aa
--- /dev/null
+++ b/package/domoticz/0001-Bumped-version.patch
@@ -0,0 +1,20 @@
+From 98723b7da9467a49222b8a7ffaae276c5bc075c1 Mon Sep 17 00:00:00 2001
+From: gizmocuz <gizmocuz@users.noreply.github.com>
+Date: Thu, 28 Jun 2018 08:00:58 +0200
+Subject: [PATCH] Bumped version
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from https://github.com/domoticz/domoticz/commit/98723b7da9467a49222b8a7ffaae276c5bc075c1]
+---
+ appversion.default | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/appversion.default b/appversion.default
+index beaa069bb..7d3530590 100644
+--- a/appversion.default
++++ b/appversion.default
+@@ -1,3 +1,3 @@
+-#define APPVERSION 5876
++#define APPVERSION 9700
+ #define APPHASH "b97777b"
+ #define APPDATE 1478691222
-- 
2.14.1
