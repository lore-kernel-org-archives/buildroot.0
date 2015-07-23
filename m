From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:42:39 +0200
Subject: [Buildroot] [git commit] orbit: bump to version 2.2.3
Message-ID: <20150723204245.EC8A781E8C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37760dab1d0d83065033aabccbad11ad1a264137
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/orbit/orbit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index 7df7790..fa30f38 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORBIT_VERSION_UPSTREAM = 2.2.1
+ORBIT_VERSION_UPSTREAM = 2.2.3
 ORBIT_VERSION = $(ORBIT_VERSION_UPSTREAM)-1
 ORBIT_SUBDIR = orbit
 ORBIT_LICENSE = MIT
