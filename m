From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Oct 2012 10:39:20 +0200
Subject: [Buildroot] [git commit] libv4l: bump version
Message-ID: <20121011084010.3FF7599835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=387c5e2e6ba6aa7d626be868dfa3a29fd7f06ac9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libv4l/libv4l.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 21cdb6d..6c782b0 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -3,7 +3,7 @@
 # libv4l
 #
 #############################################################
-LIBV4L_VERSION = 0.8.5
+LIBV4L_VERSION = 0.8.9
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = http://linuxtv.org/downloads/v4l-utils/
 LIBV4L_INSTALL_STAGING = YES
