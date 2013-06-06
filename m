From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 23:09:09 +0200
Subject: [Buildroot] [git commit] ti-utils: fix github tarball to use commit
	id
Message-ID: <20130606211259.720E59A9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7869f83bda815279f8245913d33062e525d4efe1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ti-utils/ti-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index d739f3c..a76fde1 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TI_UTILS_VERSION = 06dbdb2
-TI_UTILS_SITE = http://github.com/gxk/ti-utils/tarball/master
+TI_UTILS_SITE = http://github.com/gxk/ti-utils/tarball/$(TI_UTILS_VERSION)
 TI_UTILS_DEPENDENCIES = libnl
 
 define TI_UTILS_BUILD_CMDS
