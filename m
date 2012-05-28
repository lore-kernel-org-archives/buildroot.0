From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 28 May 2012 21:45:11 +0200
Subject: [Buildroot] [git commit] libmnl: bump to version 1.0.3
Message-ID: <20120531113301.0863096E2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e6e6101bd552f96e32cf935cf6492864795b5364
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmnl/libmnl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmnl/libmnl.mk b/package/libmnl/libmnl.mk
index 407ca52..52719cd 100644
--- a/package/libmnl/libmnl.mk
+++ b/package/libmnl/libmnl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBMNL_VERSION = 1.0.2
+LIBMNL_VERSION = 1.0.3
 LIBMNL_SOURCE = libmnl-$(LIBMNL_VERSION).tar.bz2
 LIBMNL_SITE = http://netfilter.org/projects/libmnl/files
 LIBMNL_INSTALL_STAGING = YES
