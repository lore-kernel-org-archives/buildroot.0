From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jul 2009 10:25:39 +0200
Subject: [Buildroot] [git commit] Bump Qtopia version to 4.5.2
Message-ID: <20090703112133.BF425763A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1bbceff78a123a3f1e0422f17be12e7ffd28f803
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


---
 package/qtopia4/qtopia4.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index fb027dc..0f5f150 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -21,7 +21,7 @@
 # x86 crosscompiling under linux x86. Please remove it when the workaround
 # is no longer necessary.
 
-QTOPIA4_VERSION:=4.5.1
+QTOPIA4_VERSION:=4.5.2
 QTOPIA4_CAT:=$(BZCAT)
 
 BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME:=$(strip $(subst ",, $(BR2_PACKAGE_QTOPIA4_COMMERCIAL_USERNAME)))
-- 
1.6.3.3
