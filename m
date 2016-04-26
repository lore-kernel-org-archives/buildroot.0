From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Apr 2016 13:58:24 -0300
Subject: [Buildroot] [PATCH] libsoup: bump to version 2.54.1
Message-ID: <1461689904-28232-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsoup/libsoup.hash | 4 ++--
 package/libsoup/libsoup.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 299cdd8..45cee42 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.54/libsoup-2.54.0.1.sha256sum
-sha256	ade4920166bd036e8890d04acdc135686d877670953949fa6245797c906e38e0	libsoup-2.54.0.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.54/libsoup-2.54.1.sha256sum
+sha256	47b42c232034734d66e5f093025843a5d8cc4b2357c011085a2fd04ef02dd633	libsoup-2.54.1.tar.xz
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 5f0057a..5f5156b 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP_VERSION_MAJOR = 2.54
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0.1
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).1
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPLv2+
-- 
2.7.3
