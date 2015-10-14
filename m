From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 22:29:53 +0200
Subject: [Buildroot] [git commit] xtables-addons: bump to version 2.9
Message-ID: <20151014202958.69BAA8190B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a173a5e3d848c2d52b936289ce1b1ef764761b70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xtables-addons/xtables-addons.hash |    6 +++---
 package/xtables-addons/xtables-addons.mk   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/xtables-addons/xtables-addons.hash b/package/xtables-addons/xtables-addons.hash
index 5b60d12..c82f016 100644
--- a/package/xtables-addons/xtables-addons.hash
+++ b/package/xtables-addons/xtables-addons.hash
@@ -1,3 +1,3 @@
-# From http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.8/
-md5	246ec2f1f75c32c6e04ae9ae75b578c9	xtables-addons-2.8.tar.xz
-sha1	fb3a992e8ff3fe1967b8c6f22eba0c3475aceaf7	xtables-addons-2.8.tar.xz
+# Locally calculated after checking signature file from:
+# http://sourceforge.net/projects/xtables-addons/files/Xtables-addons/2.9/
+sha256	648f6cd17ba41916df5bb605e617b2f18461090139e67d7cf5c5bd8a04c701b0	xtables-addons-2.9.tar.xz
diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index 687a66a..30353a0 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTABLES_ADDONS_VERSION = 2.8
+XTABLES_ADDONS_VERSION = 2.9
 XTABLES_ADDONS_SOURCE = xtables-addons-$(XTABLES_ADDONS_VERSION).tar.xz
 XTABLES_ADDONS_SITE = http://downloads.sourceforge.net/project/xtables-addons/Xtables-addons
 XTABLES_ADDONS_DEPENDENCIES = iptables linux host-pkgconf
