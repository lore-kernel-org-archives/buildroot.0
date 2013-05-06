From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 May 2013 00:29:11 +0200
Subject: [Buildroot] [git commit] libnl: enable parallel make
Message-ID: <20130506223115.D18F999C7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c260b94dd70c6a10938a7e8ad35b41631aad234a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current versions of libnl (since 3.2.4, at least) do not appear to
require MAKE1.

Signed-off-by: Nathan Lynch <ntl@pobox.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnl/libnl.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 2a9f5a9..681d364 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -10,7 +10,6 @@ LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex
-LIBNL_MAKE = $(MAKE1)
 LIBNL_BINARIES = class-add class-delete class-list classid-lookup cls-add \
 	cls-delete cls-list link-list pktloc-lookup qdisc-add qdisc-delete \
 	qdisc-list
