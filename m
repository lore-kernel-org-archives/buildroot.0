From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Feb 2016 14:04:37 -0300
Subject: [Buildroot] [PATCH 3/3] gupnp-av: bump to version 0.12.8
In-Reply-To: <1455123877-9983-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455123877-9983-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1455123877-9983-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Which also means moving from unstable->stable (odd numbers in gnome
project packages are development).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gupnp-av/gupnp-av.hash | 4 ++--
 package/gupnp-av/gupnp-av.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index 0101ed4..b973171 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.11/gupnp-av-0.11.6.sha256sum:
-sha256 401991336babb18c4ebed16e75e0b4d3e5848cff7bb878bbfd54a5d15203c4cc gupnp-av-0.11.6.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.12/gupnp-av-0.12.8.sha256sum:
+sha256	759bc7d46aff894c282d17f508d9b5be82de96aa74b10cb6b0fc6c5e07cc273c	gupnp-av-0.12.8.tar.xz
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index 6360c93..5835155 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GUPNP_AV_VERSION_MAJOR = 0.11
-GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).6
+GUPNP_AV_VERSION_MAJOR = 0.12
+GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).8
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
 GUPNP_AV_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
 GUPNP_AV_LICENSE = LGPLv2+
-- 
2.4.10
