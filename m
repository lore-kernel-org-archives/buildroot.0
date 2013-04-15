From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 23:42:34 +0200
Subject: [Buildroot] [git commit] libconfig: add license information
Message-ID: <20130415215906.7DCE99B6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=357203d5044f4bc2ef5872bf13e21324f1b7e3d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libconfig/libconfig.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 3e7aa11..b826c06 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -3,8 +3,11 @@
 # libconfig
 #
 #############################################################
+
 LIBCONFIG_VERSION = 1.4.8
 LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig/
+LIBCONFIG_LICENSE = LGPLv2.1+
+LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
 LIBCONFIG_CONF_OPT = --disable-examples
 
