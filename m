From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Mar 2020 23:49:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/gupnp-tools: bump to version 0.10.0
Message-ID: <20200330214913.1344862-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update indentation of hash file (two spaces)
- Fix build with latest gupnp/gssdp thanks to
  https://gitlab.gnome.org/GNOME/gupnp-tools/-/commit/41feb3168d3870e0d017c248f20cbe85bc5acde7

Fixes:
 - No autobuilder failures yet

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp-tools/gupnp-tools.hash | 6 +++---
 package/gupnp-tools/gupnp-tools.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gupnp-tools/gupnp-tools.hash b/package/gupnp-tools/gupnp-tools.hash
index b7015e13ad..30f1b8293d 100644
--- a/package/gupnp-tools/gupnp-tools.hash
+++ b/package/gupnp-tools/gupnp-tools.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.8/gupnp-tools-0.8.15.sha256sum:
-sha256	336ef4a09b9fc83444a1594c8215e2bed55fbea5b6d1bf6b54c63104b4c497ab	gupnp-tools-0.8.15.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/0.10/gupnp-tools-0.10.0.sha256sum:
+sha256  41da7ff5ba8e2425adcb64ca5e04c81f57ca20ec6fdb84923939fdad42c6a18d  gupnp-tools-0.10.0.tar.xz
 
 # Locally computed:
-sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gupnp-tools/gupnp-tools.mk b/package/gupnp-tools/gupnp-tools.mk
index 6852697b8c..182b0145c8 100644
--- a/package/gupnp-tools/gupnp-tools.mk
+++ b/package/gupnp-tools/gupnp-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GUPNP_TOOLS_VERSION_MAJOR = 0.8
-GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).15
+GUPNP_TOOLS_VERSION_MAJOR = 0.10
+GUPNP_TOOLS_VERSION = $(GUPNP_TOOLS_VERSION_MAJOR).0
 GUPNP_TOOLS_SOURCE = gupnp-tools-$(GUPNP_TOOLS_VERSION).tar.xz
 GUPNP_TOOLS_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-tools/$(GUPNP_TOOLS_VERSION_MAJOR)
-- 
2.25.1
