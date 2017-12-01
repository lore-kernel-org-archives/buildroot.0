From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  1 Dec 2017 23:23:48 +0100
Subject: [Buildroot] [PATCH 1/1] gupnp: bump to version 1.0.2
Message-ID: <20171201222348.10245-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 7fb44ffe1..7f6086474 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.0/gupnp-1.0.1.sha256sum:
-sha256	934584cc1b361bf251a5ac271ffb1995a3c6426ce44cb64f9c6d779f2af9a6d9	gupnp-1.0.1.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.0/gupnp-1.0.2.sha256sum:
+sha256	5173fda779111c6b01cd4a5e41b594322be9d04f8c74d3361f0a0c2069c77610  	gupnp-1.0.2.tar.xz
 
 # Hash for license file:
 sha256 d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 0636632d5..de08f28ad 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_VERSION_MAJOR = 1.0
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).1
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).2
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPL-2.0+
-- 
2.14.1
