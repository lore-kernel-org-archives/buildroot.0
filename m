From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 26 May 2013 21:06:13 +0200
Subject: [Buildroot] [git commit] libsigsegv: Version bump to 2.10
Message-ID: <20130602212055.13BEC9A6A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4e7acbfdfae3c454ab8f87e630fe19d591f8a45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libsigsegv/libsigsegv.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libsigsegv/libsigsegv.mk b/package/libsigsegv/libsigsegv.mk
index b8f84da..a4be0b6 100644
--- a/package/libsigsegv/libsigsegv.mk
+++ b/package/libsigsegv/libsigsegv.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBSIGSEGV_VERSION = 2.6
+LIBSIGSEGV_VERSION = 2.10
 LIBSIGSEGV_SITE = $(BR2_GNU_MIRROR)/libsigsegv
 LIBSIGSEGV_INSTALL_STAGING = YES
 LIBSIGSEGV_LICENSE = GPLv2+
