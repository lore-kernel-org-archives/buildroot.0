From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Dec 2015 07:46:27 -0300
Subject: [Buildroot] [PATCH] cantarell: bump to version 0.0.19
Message-ID: <1450781187-19894-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cantarell/cantarell.hash | 4 ++--
 package/cantarell/cantarell.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cantarell/cantarell.hash b/package/cantarell/cantarell.hash
index d3946c6..9597550 100644
--- a/package/cantarell/cantarell.hash
+++ b/package/cantarell/cantarell.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.18.1.sha256sum
-sha256	9c5b1a2edee1d3acf30eaae3d559b2b2e1d835249cf2770f6f8bfc6af861e8f0	cantarell-fonts-0.0.18.1.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.19.sha256sum
+sha256	c7f975ef3d5cf0ed409636c59d069260783683c47ba1289ac3e66a98446e46ae	cantarell-fonts-0.0.19.tar.xz
diff --git a/package/cantarell/cantarell.mk b/package/cantarell/cantarell.mk
index ebad1b9..1ada7ac 100644
--- a/package/cantarell/cantarell.mk
+++ b/package/cantarell/cantarell.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CANTARELL_VERSION_MAJOR = 0.0
-CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).18.1
+CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).19
 CANTARELL_SITE = http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/0.0
 CANTARELL_SOURCE = cantarell-fonts-$(CANTARELL_VERSION).tar.xz
 CANTARELL_DEPENDENCIES = host-pkgconf
-- 
2.4.10
