From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  2 Dec 2017 12:19:02 +0100
Subject: [Buildroot] [PATCH 1/1] gupnp-tools: bump to version 0.8.14
Message-ID: <20171202111902.27917-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for COPYING

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp-tools/gupnp-tools.hash | 7 +++++--
 package/gupnp-tools/gupnp-tools.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index f08b4f5e0..d80d83263 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,2 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.8/gupnp-tools-0.8.13.sha256sum:
-sha256	aa3decb9d532c0e2e505adc592f431fd81c0231ded2981129e87da13712479ed	gupnp-tools-0.8.13.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.8/gupnp-tools-0.8.14.sha256sum:
+sha256	682b952b3cf43818c7d27549c152ea52e43320500820ab3392cf5a29a95e7efa	gupnp-tools-0.8.14.tar.xz
+
+# Locally computed:
+sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index b64a138ac..8f95e04f9 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_TOOLS_VERSION_MAJOR = 0.8
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).13
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).14
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
-- 
2.14.1
