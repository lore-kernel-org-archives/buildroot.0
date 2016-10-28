From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Oct 2016 12:09:39 -0300
Subject: [Buildroot] [PATCH 1/3] gupnp: bump to version 1.0.1
Message-ID: <1477667381-4953-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 6bdc0c0..48aeb49 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/0.99/gupnp-0.99.0.sha256sum:
-sha256	695c745ae7ecef9482bd91821d84bb98764cbcca0d0f71acb6d46ac1be23a1be	gupnp-0.99.0.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/1.0/gupnp-1.0.1.sha256sum:
+sha256	934584cc1b361bf251a5ac271ffb1995a3c6426ce44cb64f9c6d779f2af9a6d9	gupnp-1.0.1.tar.xz
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index fe80838..764f527 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GUPNP_VERSION_MAJOR = 0.99
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).0
+GUPNP_VERSION_MAJOR = 1.0
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).1
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPLv2+
-- 
2.7.3
