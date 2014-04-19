From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 23:52:10 +0200
Subject: [Buildroot] [git commit] orbit: bump to version 2.2.1
Message-ID: <20140419215315.E02DD9C0C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90c72d8e817227fe95cf62edec8450124e8b6bb0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/orbit/orbit.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/orbit/orbit.mk b/package/orbit/orbit.mk
index e5a8676..970d1e2 100644
--- a/package/orbit/orbit.mk
+++ b/package/orbit/orbit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ORBIT_VERSION_UPSTREAM = 2.2.0
-ORBIT_VERSION = $(ORBIT_VERSION_UPSTREAM)-2
-ORBIT_SUBDIR  = orbit-$(ORBIT_VERSION_UPSTREAM)
+ORBIT_VERSION_UPSTREAM = 2.2.1
+ORBIT_VERSION = $(ORBIT_VERSION_UPSTREAM)-1
+ORBIT_SUBDIR  = orbit
 ORBIT_LICENSE = MIT
 ORBIT_LICENSE_FILES = $(ORBIT_SUBDIR)/doc/us/license.md
 
