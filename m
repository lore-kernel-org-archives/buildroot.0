From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jan 2011 11:18:50 +0100
Subject: [Buildroot] [git commit master 1/1] sysvinint: bump Debian patch
Message-ID: <20110126102009.E0B978B52D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=31a1995ac3008cfcdb399d9e46e97ac88352e3b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-13 patch no longer available on the Debian mirrors.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sysvinit/sysvinit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index b22f0f2..97576b8 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -5,7 +5,7 @@
 #############################################################
 SYSVINIT_VERSION = 2.88
 SYSVINIT_SOURCE  = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
-SYSVINIT_PATCH   = sysvinit_$(SYSVINIT_VERSION)dsf-13.diff.gz
+SYSVINIT_PATCH   = sysvinit_$(SYSVINIT_VERSION)dsf-13.1.diff.gz
 SYSVINIT_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
 
 # Override Busybox implementations if Busybox is enabled.
-- 
1.7.3.4
