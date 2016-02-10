From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2016 18:11:36 +0100
Subject: [Buildroot] [git commit branch/next] gupnp: bump to version 0.20.16
Message-ID: <20160210171146.5E62F80386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a279cf74bcea4f57f5bd2887b8e8a43026a2197f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Which also means moving from unstable->stable (odd numbers in gnome
project packages are development).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gupnp/gupnp.hash | 4 ++--
 package/gupnp/gupnp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
index 597cb42..4208ecd 100644
--- a/package/gupnp/gupnp.hash
+++ b/package/gupnp/gupnp.hash
@@ -1,2 +1,2 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/0.19/gupnp-0.19.4.sha256sum:
-sha256 3c1fb2873cb2f8f152b9d49598d55b15b8f3c1096a03ade46ce69694798fb243  gupnp-0.19.4.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp/0.20/gupnp-0.20.16.sha256sum:
+sha256	ff1119eff12529c46837e03c742f69dc4fae48d59097d79582d38a383b832602	gupnp-0.20.16.tar.xz
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
index 85faaa4..c3ec0a0 100644
--- a/package/gupnp/gupnp.mk
+++ b/package/gupnp/gupnp.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GUPNP_VERSION_MAJOR = 0.19
-GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).4
+GUPNP_VERSION_MAJOR = 0.20
+GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).16
 GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
 GUPNP_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp/$(GUPNP_VERSION_MAJOR)
 GUPNP_LICENSE = LGPLv2+
