From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 22:16:14 +0100
Subject: [Buildroot] [git commit] libnfc-llcp: bump version
Message-ID: <20121115213534.330E99A02C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7319eaecbe075f67bb4f71d56c7cbe7f6a4776e5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnfc-llcp/libnfc-llcp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnfc-llcp/libnfc-llcp.mk b/package/libnfc-llcp/libnfc-llcp.mk
index 57821c1..0bff089 100644
--- a/package/libnfc-llcp/libnfc-llcp.mk
+++ b/package/libnfc-llcp/libnfc-llcp.mk
@@ -3,7 +3,7 @@
 # libnfc-llcp
 #
 #############################################################
-LIBNFC_LLCP_VERSION = 1090
+LIBNFC_LLCP_VERSION = 1103
 LIBNFC_LLCP_SITE = http://nfc-tools.googlecode.com/svn/trunk/libnfc-llcp/
 LIBNFC_LLCP_SITE_METHOD = svn
 LIBNFC_LLCP_DEPENDENCIES = libnfc
