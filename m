From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 21 Jan 2016 11:12:33 -0300
Subject: [Buildroot] [PATCH] libsecret: bump to version 0.18.4
Message-ID: <1453385553-9419-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsecret/libsecret.hash | 4 ++--
 package/libsecret/libsecret.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsecret/libsecret.hash b/package/libsecret/libsecret.hash
index d40f320..cd405e6 100644
--- a/package/libsecret/libsecret.hash
+++ b/package/libsecret/libsecret.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.18/libsecret-0.18.3.sha256sum
-sha256	f2bf1d0c5ab4640664f3e3c7ef6b086c180e50ff415720b5e22f96750dbf84c9	libsecret-0.18.3.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/libsecret/0.18/libsecret-0.18.4.sha256sum
+sha256	0f29b51698198e6999c91f4adce3119c8c457f546b133a85baea5ea9010a19ed	libsecret-0.18.4.tar.xz
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index a762dd7..84e9f3b 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSECRET_VERSION_MAJOR = 0.18
-LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).3
+LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).4
 LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION_MAJOR)
 LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
 LIBSECRET_INSTALL_STAGING = YES
-- 
2.4.10
