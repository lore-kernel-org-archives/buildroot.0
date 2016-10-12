From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Oct 2016 09:37:32 -0300
Subject: [Buildroot] [PATCH] libgee: bump to version 0.18.1
Message-ID: <1476275852-25532-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgee/libgee.hash | 4 ++--
 package/libgee/libgee.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgee/libgee.hash b/package/libgee/libgee.hash
index 4c38c78..83ac810 100644
--- a/package/libgee/libgee.hash
+++ b/package/libgee/libgee.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.18/libgee-0.18.0.sha256sum
-sha256	4ad99ef937d071b4883c061df40bfe233f7649d50c354cf81235f180b4244399	libgee-0.18.0.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/libgee/0.18/libgee-0.18.1.sha256sum
+sha256	99686bbe5a9c89ba9502c25f61314ee8efa0dd2a1159c9a639afc1458c2839a2	libgee-0.18.1.tar.xz
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 1df322c..1df54d2 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGEE_VERSION_MAJOR = 0.18
-LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).0
+LIBGEE_VERSION = $(LIBGEE_VERSION_MAJOR).1
 LIBGEE_SITE = http://ftp.gnome.org/pub/gnome/sources/libgee/$(LIBGEE_VERSION_MAJOR)
 LIBGEE_SOURCE = libgee-$(LIBGEE_VERSION).tar.xz
 LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
-- 
2.7.3
