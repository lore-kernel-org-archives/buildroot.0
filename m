From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 09:31:56 +0100
Subject: [Buildroot] [git commit] package/atop: bump to version 2.5.0
Message-ID: <20191231082240.47EBC8E8C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=826a601b44ba60402aacd378cb480305f705faa1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

./utils/test-pkg --package atop --all
44 builds, 5 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/atop/atop.hash | 2 +-
 package/atop/atop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/atop/atop.hash b/package/atop/atop.hash
index 80082d022d..f404ed5d1b 100644
--- a/package/atop/atop.hash
+++ b/package/atop/atop.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  be1c010a77086b7d98376fce96514afcd73c3f20a8d1fe01520899ff69a73d69  atop-2.4.0.tar.gz
+sha256  4b911057ce50463b6e8b3016c5963d48535c0cddeebc6eda817e292b22f93f33  atop-2.5.0.tar.gz
 
 # Hash for license file:
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index 4ea1ccf26f..46baff8f72 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATOP_VERSION = 2.4.0
+ATOP_VERSION = 2.5.0
 ATOP_SITE = http://www.atoptool.nl/download
 ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
