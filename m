From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:14:50 +0200
Subject: [Buildroot] [git commit] libmpd: bump to version 11.8.17
Message-ID: <20111015213658.EA84F8D520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0739590154345f9db9627e3e6f669e7902b4bbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libmpd/libmpd.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/multimedia/libmpd/libmpd.mk b/package/multimedia/libmpd/libmpd.mk
index a58b537..9fd12f5 100644
--- a/package/multimedia/libmpd/libmpd.mk
+++ b/package/multimedia/libmpd/libmpd.mk
@@ -3,9 +3,9 @@
 # libmpd
 #
 #############################################################
-LIBMPD_VERSION = 0.17.0
-LIBMPD_SOURCE = libmpd-$(LIBMPD_VERSION).tar.gz
-LIBMPD_SITE = http://download.sarine.nl/download/Programs/gmpc/$(LIBMPD_VERSION)/
+
+LIBMPD_VERSION = 11.8.17
+LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8.16
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_DEPENDENCIES = libglib2
 
