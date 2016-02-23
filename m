From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2016 22:55:32 +0100
Subject: [Buildroot] [git commit] cantarell: bump to version 0.0.23
Message-ID: <20160302202756.9D7947FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6bddaec684a73a9d8bdd01d34efaea602cbcf3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cantarell/cantarell.hash | 4 ++--
 package/cantarell/cantarell.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cantarell/cantarell.hash b/package/cantarell/cantarell.hash
index 5d8284d..2d2bab5 100644
--- a/package/cantarell/cantarell.hash
+++ b/package/cantarell/cantarell.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.21.sha256sum
-sha256	2d3e925574648f0902c61975f84acac445ee9cda826280644bdf772960b46e85	cantarell-fonts-0.0.21.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.23.sha256sum
+sha256	d85e165ac5d676d6b21c7870d8243cb612a2dc766d91fda788d56d5f5ad5db4e	cantarell-fonts-0.0.23.tar.xz
diff --git a/package/cantarell/cantarell.mk b/package/cantarell/cantarell.mk
index c677c78..9943d70 100644
--- a/package/cantarell/cantarell.mk
+++ b/package/cantarell/cantarell.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CANTARELL_VERSION_MAJOR = 0.0
-CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).21
+CANTARELL_VERSION = $(CANTARELL_VERSION_MAJOR).23
 CANTARELL_SITE = http://ftp.gnome.org/pub/gnome/sources/cantarell-fonts/$(CANTARELL_VERSION_MAJOR)
 CANTARELL_SOURCE = cantarell-fonts-$(CANTARELL_VERSION).tar.xz
 CANTARELL_DEPENDENCIES = host-pkgconf
