From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 06:42:57 +0200
Subject: [Buildroot] [git commit] a10disp: bump to version v0.6.1
Message-ID: <20150621044308.C61967FD5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=444652de233a1a52665c76d22192de0e8469a7a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/a10disp/a10disp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/a10disp/a10disp.mk b/package/a10disp/a10disp.mk
index 066e988..7353ede 100644
--- a/package/a10disp/a10disp.mk
+++ b/package/a10disp/a10disp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-A10DISP_VERSION = a899cc6dcf909360aac00482ede5369f3656f226
+A10DISP_VERSION = v0.6.1
 A10DISP_SITE = $(call github,hglm,a10disp,$(A10DISP_VERSION))
 A10DISP_LICENSE = MIT
 
