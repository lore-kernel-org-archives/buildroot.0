From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Jul 2015 07:52:51 +0200
Subject: [Buildroot] [git commit] xtables-addons: bump to version 2.7
Message-ID: <20150707062302.A34EE7FF99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eaa872edca27c6f375dbf603d83574fec23584f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build issues with kernels 4.1+

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xtables-addons/xtables-addons.hash |    6 +++---
 package/xtables-addons/xtables-addons.mk   |    4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index d742aed..02e646f 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.6/
-md5	087835ba7e564481b6fd398692268340	xtables-addons-2.6.tar.xz
-sha1	10586961a70fd4fe4f972cb3f31962c6766b359c	xtables-addons-2.6.tar.xz
+# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.7/
+md5	81bd7ba82e5f7bfd1458fc97ddf72e1d	xtables-addons-2.7.tar.xz
+sha1	82c13237ef2a62e57832b160832f4b9c4fb8c7c5	xtables-addons-2.7.tar.xz
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index dcfbd5e..75e2a5a 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 2.6
+XTABLES_ADDONS_VERSION = 2.7
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
-XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons/$(XTABLES_ADDONS_VERSION)
+XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
 XTABLES_ADDONS_LICENSE = GPLv2+
 XTABLES_ADDONS_LICENSE_FILES = LICENSE
