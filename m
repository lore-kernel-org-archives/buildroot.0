From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 22:32:10 +0200
Subject: [Buildroot] [git commit] libglib2: bump to 2.54.1
Message-ID: <20171018202455.8EE418109D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=57c15820dbab992fcd383f37f2f1eea85252a4cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index 083b95d..4316378 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,2 +1,2 @@
-# https://download.gnome.org/sources/glib/2.50/glib-2.52.2.sha256sum
-sha256  f00e5d9e2a2948b1da25fcba734a6b7a40f556de8bc9f528a53f6569969ac5d0  glib-2.52.2.tar.xz
+# https://download.gnome.org/sources/glib/2.54/glib-2.54.1.sha256sum
+sha256  50c01b1419324f10fbf9b9709ec2164b18586968bdce7540583bf32302cf47a3  glib-2.54.1.tar.xz
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index d93a1de..2defcf0 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.52
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
+LIBGLIB2_VERSION_MAJOR = 2.54
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.0+
