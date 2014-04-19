From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Apr 2014 22:57:56 +0200
Subject: [Buildroot] [PATCH 4/8] orbit: bump to version 2.2.1
In-Reply-To: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
References: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1397941080-24157-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/orbit/orbit.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
 
-- 
1.9.1
