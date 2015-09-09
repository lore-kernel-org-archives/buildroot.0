From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Sep 2015 23:23:26 +0200
Subject: [Buildroot] [git commit] xtables-addons: bump to version 2.8
Message-ID: <20150909212400.CD4BC81EF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16d314845120b9d9c4b3fe318c8c8f4162c18932
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With support for linux kernel 4.2

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xtables-addons/xtables-addons.hash |    6 +++---
 package/xtables-addons/xtables-addons.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 02e646f..5b60d12 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.7/
-md5	81bd7ba82e5f7bfd1458fc97ddf72e1d	xtables-addons-2.7.tar.xz
-sha1	82c13237ef2a62e57832b160832f4b9c4fb8c7c5	xtables-addons-2.7.tar.xz
+# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.8/
+md5	246ec2f1f75c32c6e04ae9ae75b578c9	xtables-addons-2.8.tar.xz
+sha1	fb3a992e8ff3fe1967b8c6f22eba0c3475aceaf7	xtables-addons-2.8.tar.xz
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index d16341f..687a66a 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 2.7
+XTABLES_ADDONS_VERSION = 2.8
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
