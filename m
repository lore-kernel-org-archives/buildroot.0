From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Sep 2015 07:26:16 -0300
Subject: [Buildroot] [PATCH 2/2] libgtk3: bump to version 3.14.15
In-Reply-To: <1441103176-26110-1-git-send-email-gustavo@zacarias.com.ar>
References: <1441103176-26110-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1441103176-26110-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index de78751..b310aec 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.14/gtk+-3.14.13.sha256sum
-sha256	b1efcb1ef299f9b205e6f4512428315fd03484e5790f65bd3ac164e84ade90b0	gtk+-3.14.13.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.14/gtk+-3.14.15.sha256sum
+sha256	3ac87659112ced9e5ee5bd55d055faa881aafd040f26ca40b0d8ba0fa6509c83	gtk+-3.14.15.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 80dbf94..d268b56 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.14
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).13
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).15
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
-- 
2.4.6
