From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 12:03:13 +0100
Subject: [Buildroot] [git commit] package: remove the default value of the
 $(PKG)_SOURCE variable
Message-ID: <20171217110326.773698119A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20cdd433142e49a6c9e35085565e7f2c4ce97e44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pimd/pimd.mk             | 1 -
 package/proj/proj.mk             | 1 -
 package/traceroute/traceroute.mk | 1 -
 3 files changed, 3 deletions(-)

diff --git a/package/pimd/pimd.mk b/package/pimd/pimd.mk
index 21b5e10..7a12f8f 100644
--- a/package/pimd/pimd.mk
+++ b/package/pimd/pimd.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PIMD_VERSION = 2.3.2
-PIMD_SOURCE = pimd-$(PIMD_VERSION).tar.gz
 PIMD_SITE = https://github.com/troglobit/pimd/releases/download/$(PIMD_VERSION)
 
 PIMD_LICENSE = BSD-3-Clause
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 5607dc0..6d029bb 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 PROJ_VERSION = 4.9.3
-PROJ_SOURCE = proj-$(PROJ_VERSION).tar.gz
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
diff --git a/package/traceroute/traceroute.mk b/package/traceroute/traceroute.mk
index 9d74b8f..d01c62d 100644
--- a/package/traceroute/traceroute.mk
+++ b/package/traceroute/traceroute.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 TRACEROUTE_VERSION = 2.1.0
-TRACEROUTE_SOURCE = traceroute-$(TRACEROUTE_VERSION).tar.gz
 TRACEROUTE_SITE = http://downloads.sourceforge.net/traceroute/traceroute/traceroute-$(TRACEROUTE_VERSION)
 
 TRACEROUTE_LICENSE = GPL-2.0+, LGPL-2.1+
