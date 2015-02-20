From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:33:13 +0100
Subject: [Buildroot] [git commit branch/next] liblinear: cleanup URL address
Message-ID: <20150220183318.EA5A1817C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b61a5ad48515448d6bbae3fe750b19a55792825
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/liblinear/liblinear.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 38aaefc..9eff62a 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBLINEAR_VERSION = 1.96
-LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear/$(LIBLINEAR_VERSION_MAJOR)
+LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3c
 LIBLINEAR_LICENSE_FILES = COPYING
 LIBLINEAR_INSTALL_STAGING = YES
