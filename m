From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 28 Jan 2019 19:55:04 +0100
Subject: [Buildroot] [PATCH 1/1] jansson: bump to version 2.12
Message-ID: <20190128185504.6806-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update hash of license file (update in year):
https://github.com/akheron/jansson/commit/3e13f514ce5185a057a686221b61d9a9d9e86889

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jansson/jansson.hash | 4 ++--
 package/jansson/jansson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
index e169b229cb..5baec1968d 100644
--- a/package/jansson/jansson.hash
+++ b/package/jansson/jansson.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256	6e85f42dabe49a7831dbdd6d30dca8a966956b51a9a50ed534b82afc3fa5b2f4	jansson-2.11.tar.gz
-sha256	3034b2319f8c053995e8c8abf11b76418a3a8836cd769e5b3f0b6b13bfa00ec4	LICENSE
+sha256	5f8dec765048efac5d919aded51b26a32a05397ea207aa769ff6b53c7027d2c9	jansson-2.12.tar.gz
+sha256	f0a0c95c64e9f49ec4cbfac8e7fee06823c85ee8ba4af5d57aaabb372347adc2	LICENSE
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 920008757b..b53381d465 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.11
+JANSSON_VERSION = 2.12
 JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
-- 
2.14.1
