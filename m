From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Jul 2015 11:01:00 -0300
Subject: [Buildroot] [PATCH 2/2] glib-networking: bump to version 2.44.0
In-Reply-To: <1436882460-19397-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436882460-19397-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436882460-19397-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/glib-networking/glib-networking.hash | 4 ++--
 package/glib-networking/glib-networking.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/glib-networking/glib-networking.hash b/package/glib-networking/glib-networking.hash
index 0d85782..03ed3ae 100644
--- a/package/glib-networking/glib-networking.hash
+++ b/package/glib-networking/glib-networking.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.42/glib-networking-2.42.1.sha256sum
-sha256	c06bf76da3353695fcc791b7b02e5d60c01c379e554f7841dc6cbca32f65f3a0	glib-networking-2.42.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/glib-networking/2.44/glib-networking-2.44.0.sha256sum
+sha256	8f8a340d3ba99bfdef38b653da929652ea6640e27969d29f7ac51fbbe11a4346	glib-networking-2.44.0.tar.xz
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 43536d9..0ef69c4 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GLIB_NETWORKING_VERSION_MAJOR = 2.42
-GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).1
+GLIB_NETWORKING_VERSION_MAJOR = 2.44
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_VERSION_MAJOR).0
 GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_VERSION_MAJOR)
 GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
 GLIB_NETWORKING_INSTALL_STAGING = YES
-- 
2.3.6
