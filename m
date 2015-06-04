From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  4 Jun 2015 10:39:25 -0300
Subject: [Buildroot] [PATCH 2/2] libgtk3: bump to version 3.14.13
In-Reply-To: <1433425165-24392-1-git-send-email-gustavo@zacarias.com.ar>
References: <1433425165-24392-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1433425165-24392-2-git-send-email-gustavo@zacarias.com.ar>
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
index e9e900f..de78751 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.14/gtk+-3.14.11.sha256sum
-sha256	3fb59e99de38001b1b84a7f292553d0e2305991053d6989d6cd09acd1418f7c8	gtk+-3.14.11.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/gtk+/3.14/gtk+-3.14.13.sha256sum
+sha256	b1efcb1ef299f9b205e6f4512428315fd03484e5790f65bd3ac164e84ade90b0	gtk+-3.14.13.tar.xz
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 6badba3..ee73291 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.14
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).11
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).13
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPLv2+
-- 
2.3.6
