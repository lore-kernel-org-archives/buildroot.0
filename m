From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Mar 2016 22:57:15 +0100
Subject: [Buildroot] [git commit] cantarell: bump to version 0.0.24
Message-ID: <20160302220356.349BB800B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97827718df90f4f91c72bc452cc05c769260179f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cantarell/cantarell.hash | 4 ++--
 package/cantarell/cantarell.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cantarell/cantarell.hash b/package/cantarell/cantarell.hash
index 2d2bab5..e2cc00e 100644
--- a/package/cantarell/cantarell.hash
+++ b/package/cantarell/cantarell.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.23.sha256sum
-sha256	d85e165ac5d676d6b21c7870d8243cb612a2dc766d91fda788d56d5f5ad5db4e	cantarell-fonts-0.0.23.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.24.sha256sum
+sha256	9cad649ae84f7e4ca1be637c27e2fa19e1fbf00d4bf6480171ccfad405b39264	cantarell-fonts-0.0.24.tar.xz
diff --git a/package/cantarell/cantarell.mk b/package/cantarell/cantarell.mk
index 9943d70..b4133ec 100644
--- a/package/cantarell/cantarell.mk
+++ b/package/cantarell/cantarell.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CANTARELL_VERSION_MAJOR = 0.0
-CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).23
+CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).24
 CANTARELL_SITE = http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/$(CANTARELL_VERSION_MAJOR)
 CANTARELL_SOURCE = cantarell-fonts-$(CANTARELL_VERSION).tar.xz
 CANTARELL_DEPENDENCIES = host-pkgconf
