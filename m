From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 16:43:42 +0100
Subject: [Buildroot] [git commit] libnl: add missing dependency on host-flex
Message-ID: <20130324154333.7807C9B283@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97e723b0f1c32284c7a87fb4039ed7ef12956877
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.org/results/9c496031fef011b86113e342a8ca4a36ae360bb1/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnl/libnl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 7620cf7..2a9f5a9 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -9,7 +9,7 @@ LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
-LIBNL_DEPENDENCIES = host-bison
+LIBNL_DEPENDENCIES = host-bison host-flex
 LIBNL_MAKE = $(MAKE1)
 LIBNL_BINARIES = class-add class-delete class-list classid-lookup cls-add \
 	cls-delete cls-list link-list pktloc-lookup qdisc-add qdisc-delete \
