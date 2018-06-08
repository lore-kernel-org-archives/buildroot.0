From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Jun 2018 23:57:44 +0200
Subject: [Buildroot] [PATCH 1/1] jansson: bump to version 2.11
Message-ID: <20180608215744.3360-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jansson/jansson.hash | 3 ++-
 package/jansson/jansson.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
index 7a04586c70..e169b229cb 100644
--- a/package/jansson/jansson.hash
+++ b/package/jansson/jansson.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256	78215ad1e277b42681404c1d66870097a50eb084be9d771b1d15576575cf6447	jansson-2.10.tar.gz
+sha256	6e85f42dabe49a7831dbdd6d30dca8a966956b51a9a50ed534b82afc3fa5b2f4	jansson-2.11.tar.gz
+sha256	3034b2319f8c053995e8c8abf11b76418a3a8836cd769e5b3f0b6b13bfa00ec4	LICENSE
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 9771434c89..920008757b 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.10
+JANSSON_VERSION = 2.11
 JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
-- 
2.14.1
