From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Jan 2012 16:02:54 +0100
Subject: [Buildroot] [git commit] cdrkit: remove redundant
	HOST_CDRKIT_DEPENDENCIES
Message-ID: <20120118150407.AC68F90383@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fcf418180a5200ac347f980a3e01a3f5a42cf321
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cdrkit/cdrkit.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index fc22c18..a060b03 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -7,7 +7,6 @@
 CDRKIT_VERSION = 1.1.11
 CDRKIT_SITE = http://www.cdrkit.org/releases
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
-HOST_CDRKIT_DEPENDENCIES = host-libcap host-bzip2 host-zlib
 
 ifeq ($(BR2_ENDIAN),"BIG")
 CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
