From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 15 Sep 2018 12:35:44 +0200
Subject: [Buildroot] [PATCH 1/1] owfs: bump to version 3.2p2
Message-ID: <20180915103544.19912-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/owfs/owfs.hash | 10 ++++++----
 package/owfs/owfs.mk   |  2 +-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/owfs/owfs.hash b/package/owfs/owfs.hash
index 1e57e29561..eeea64368c 100644
--- a/package/owfs/owfs.hash
+++ b/package/owfs/owfs.hash
@@ -1,5 +1,7 @@
-# From https://sourceforge.net/projects/owfs/files/owfs/3.2p1/
-md5 fb42ce3b8a49f0b62711d8e3f5f04880  owfs-3.2p1.tar.gz
-sha1 4ee76e686bec769acde5bfbda148a8693df244c6  owfs-3.2p1.tar.gz
+# From https://sourceforge.net/projects/owfs/files/owfs/3.2p2/
+md5  f85e81837fe9ec273499a17f2f7a9143 owfs-3.2p2.tar.gz
+sha1 d04032696a3fba9f250a9a1d552361072a9f22ea  owfs-3.2p2.tar.gz
 # Locally calculated
-sha256 33220b25db36969a717cd27e750d73dee376795e13a5f3677f05111b745832ea  owfs-3.2p1.tar.gz
+sha256 39535521a65a74bd36dc31726bcf04201f60f230a7944e9a63c393c318f5113c  owfs-3.2p2.tar.gz
+sha256 e484a24fa5d177576e1672306165f495633bd5f0daaf628d1ff5ecfc85bdc637  COPYING
+sha256 3879dcca586c08d1fe3325f3a0aec5b47d543100bc6b1dfb30bf24ec48675b10  COPYING.LIB
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index fa6810d01d..e120147151 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OWFS_VERSION = 3.2p1
+OWFS_VERSION = 3.2p2
 OWFS_SITE = http://downloads.sourceforge.net/project/owfs/owfs/$(OWFS_VERSION)
 OWFS_DEPENDENCIES = host-pkgconf
 OWFS_CONF_OPTS = --disable-owperl --without-perl5 --disable-owtcl --without-tcl
-- 
2.17.1
