From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Oct 2016 12:09:41 -0300
Subject: [Buildroot] [PATCH 3/3] gupnp-av: bump to version 0.12.10
In-Reply-To: <1477667381-4953-1-git-send-email-gustavo@zacarias.com.ar>
References: <1477667381-4953-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1477667381-4953-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gupnp-av/gupnp-av.hash | 4 ++--
 package/gupnp-av/gupnp-av.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index b973171..8fe7782 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.12/gupnp-av-0.12.8.sha256sum:
-sha256	759bc7d46aff894c282d17f508d9b5be82de96aa74b10cb6b0fc6c5e07cc273c	gupnp-av-0.12.8.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.12/gupnp-av-0.12.10.sha256sum:
+sha256	8038ef84dddbe7ad91c205bf91dddf684f072df8623f39b6555a6bb72837b85a	gupnp-av-0.12.10.tar.xz
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index 5835155..40e6c8c 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GUPNP_AV_VERSION_MAJOR = 0.12
-GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).8
+GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).10
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
 GUPNP_AV_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
 GUPNP_AV_LICENSE = LGPLv2+
-- 
2.7.3
