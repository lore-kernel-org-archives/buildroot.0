From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 01 Dec 2015 23:21:16 -0000
Subject: [Buildroot] [git commit] libsoup: bump to version 2.52.2
Message-ID: <20151201232115.4CD74821F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=beec4437a06a570c41050c0abc2865110b54f828
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsoup/libsoup.hash | 4 ++--
 package/libsoup/libsoup.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libsoup/libsoup.hash b/package/libsoup/libsoup.hash
index 58e3eb2..7878550 100644
--- a/package/libsoup/libsoup.hash
+++ b/package/libsoup/libsoup.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.52/libsoup-2.52.1.sha256sum
-sha256	0e19bca047ad50b28e8ed7663840f9e45a94909148822ca44dcb3e8cafb5cc48	libsoup-2.52.1.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsoup/2.52/libsoup-2.52.2.sha256sum
+sha256	db55628b5c7d952945bb71b236469057c8dfb8dea0c271513579c6273c2093dc	libsoup-2.52.2.tar.xz
diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index e43e25c..fd51a0e 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSOUP_VERSION_MAJOR = 2.52
-LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).1
+LIBSOUP_VERSION = $(LIBSOUP_VERSION_MAJOR).2
 LIBSOUP_SOURCE = libsoup-$(LIBSOUP_VERSION).tar.xz
 LIBSOUP_SITE = http://ftp.gnome.org/pub/gnome/sources/libsoup/$(LIBSOUP_VERSION_MAJOR)
 LIBSOUP_LICENSE = LGPLv2+
