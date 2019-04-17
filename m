From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 08:55:19 +0200
Subject: [Buildroot] [git commit] package/check: bump to version 0.12
Message-ID: <20190417065054.6E23F8121D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9e559ad72bb272d624c622b8137eff7e4751637
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/check/check.hash | 2 +-
 package/check/check.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/check/check.hash b/package/check/check.hash
index 3c41a96144..ac7fddd462 100644
--- a/package/check/check.hash
+++ b/package/check/check.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256	24f7a48aae6b74755bcbe964ce8bc7240f6ced2141f8d9cf480bc3b3de0d5616	check-0.11.0.tar.gz
+sha256	464201098bee00e90f5c4bdfa94a5d3ead8d641f9025b560a27755a83b824234	check-0.12.0.tar.gz
 # License files, locally calculated
 sha256	a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861	COPYING.LESSER
diff --git a/package/check/check.mk b/package/check/check.mk
index 047beba635..84b8c5333e 100644
--- a/package/check/check.mk
+++ b/package/check/check.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECK_VERSION = 0.11.0
+CHECK_VERSION = 0.12.0
 CHECK_SITE = https://github.com/libcheck/check/releases/download/$(CHECK_VERSION)
 CHECK_INSTALL_STAGING = YES
 CHECK_DEPENDENCIES = host-pkgconf
