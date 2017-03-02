From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  2 Mar 2017 19:47:18 -0300
Subject: [Buildroot] [PATCH] libepoxy: bump to version 1.4.1
Message-ID: <20170302224718.17265-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libepoxy/libepoxy.hash | 4 ++--
 package/libepoxy/libepoxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
index eec1363..7d2ade8 100644
--- a/package/libepoxy/libepoxy.hash
+++ b/package/libepoxy/libepoxy.hash
@@ -1,2 +1,2 @@
-# From ftp://ftp.gnome.org/pub/gnome/sources/libepoxy/1.4/libepoxy-1.4.0.sha256sum
-sha256 25a906b14a921bc2b488cfeaa21a00486fe92630e4a9dd346e4ecabeae52ab41  libepoxy-1.4.0.tar.xz
+# From ftp://ftp.gnome.org/pub/gnome/sources/libepoxy/1.4/libepoxy-1.4.1.sha256sum
+sha256 88c6abf5522fc29bab7d6c555fd51a855cbd9253c4315f8ea44e832baef21aa6  libepoxy-1.4.1.tar.xz
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index 1b0f52f..be8c55e 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEPOXY_VERSION_MAJOR = 1.4
-LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).0
+LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).1
 LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
 LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
 LIBEPOXY_INSTALL_STAGING = YES
-- 
2.10.2
