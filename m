From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:54:35 +0200
Subject: [Buildroot] [git commit] cloog: remove INSTALL_STAGING = YES
Message-ID: <20140609095505.B58F49BA7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4c8e74f8508f738dfb520758c7198fd9f69c1fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package is host-only, so there's no point in specifying
INSTALL_STAGING = YES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cloog/cloog.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
index 1e2e88c..2dc96c4 100644
--- a/package/cloog/cloog.mk
+++ b/package/cloog/cloog.mk
@@ -6,7 +6,6 @@
 
 CLOOG_VERSION = 0.18.2
 CLOOG_SITE = http://www.bastoul.net/cloog/pages/download/
-CLOOG_INSTALL_STAGING = YES
 CLOOG_LICENSE = LGPLv2.1+
 CLOOG_DEPENDENCIES = gmp isl
 # Our libtool patch doesn't apply, and since this package is only
