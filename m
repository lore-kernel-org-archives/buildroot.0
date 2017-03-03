From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Mar 2017 21:50:02 +0100
Subject: [Buildroot] [git commit] libepoxy: bump to version 1.4.1
Message-ID: <20170303205006.1CDC18223A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e774b398b77c5a1e978824956916a3c336d6417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
