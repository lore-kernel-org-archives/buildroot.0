From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Sep 2016 12:01:33 -0300
Subject: [Buildroot] [PATCH 4/7] libsoup: bump to version 2.56.0
In-Reply-To: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
References: <1474383696-4045-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1474383696-4045-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsoup/libsoup.hash | 4 ++--
 package/libsoup/libsoup.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 45cee42..b42cf2f 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.54/libsoup-2.54.1.sha256sum
-sha256	47b42c232034734d66e5f093025843a5d8cc4b2357c011085a2fd04ef02dd633	libsoup-2.54.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.56/libsoup-2.56.0.sha256sum
+sha256	d8216b71de8247bc6f274ec054c08547b2e04369c1f8add713e9350c8ef81fe5	libsoup-2.56.0.tar.xz
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 5f5156b..f6e92f8 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSOUP_VERSION_MAJOR = 2.54
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).1
+LIBSOUP_VERSION_MAJOR = 2.56
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).0
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPLv2+
-- 
2.7.3
