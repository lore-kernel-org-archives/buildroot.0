From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 19:09:32 +0100
Subject: [Buildroot] [git commit] libnfnetlink: bump to version 1.0.1
Message-ID: <20121103182339.D3D7F99A6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50fbbd3f6dcbb8c1ebd2d2e97310c2ff7cf39aa6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnfnetlink/libnfnetlink.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnfnetlink/libnfnetlink.mk b/package/libnfnetlink/libnfnetlink.mk
index 9af28d8..2d79cdb 100644
--- a/package/libnfnetlink/libnfnetlink.mk
+++ b/package/libnfnetlink/libnfnetlink.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNFNETLINK_VERSION = 1.0.0
+LIBNFNETLINK_VERSION = 1.0.1
 LIBNFNETLINK_SOURCE = libnfnetlink-$(LIBNFNETLINK_VERSION).tar.bz2
 LIBNFNETLINK_SITE = http://www.netfilter.org/projects/libnfnetlink/files
 LIBNFNETLINK_INSTALL_STAGING = YES
