From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 14:52:44 +0100
Subject: [Buildroot] [git commit] dropbear: bump to version 2016.73
Message-ID: <20160320135249.E7286801E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83d95eebaebea4d8df1dba1c27b22895522d6524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

some new runtime options, minor fixes, and fixes for issues found by
various code analyze and lintian tools.

Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dropbear/dropbear.hash | 2 +-
 package/dropbear/dropbear.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index 8287244..2692889 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,2 +1,2 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256	9323766d3257699fd7d6e7b282c5a65790864ab32fd09ac73ea3d46c9ca2d681  dropbear-2016.72.tar.bz2
+sha256	5c61a4f69b093b688629cd365be38701485ff63cfb23642dab7a05ad250aefd7  dropbear-2016.73.tar.bz2
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 4ba94c3..32e2167 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2016.72
+DROPBEAR_VERSION = 2016.73
 DROPBEAR_SITE = http://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2c-like, BSD-2c
