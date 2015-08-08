From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:51 -0000
Subject: [Buildroot] [git commit branch/next] orbit: bump to version 2.2.3
Message-ID: <20150808105640.909F97FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37760dab1d0d83065033aabccbad11ad1a264137
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
