From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 21:51:56 +0200
Subject: [Buildroot] [git commit] heirloom-mailx: add license info
Message-ID: <20140913200105.364159D68A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20d314fb0b89fd82d5077e0365f101e8f27d0c22
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop unused IEEE part as suggested by Baruch]
Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heirloom-mailx/heirloom-mailx.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index 75221d4..e7a12c7 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -7,6 +7,8 @@
 HEIRLOOM_MAILX_VERSION = 12.5
 HEIRLOOM_MAILX_SOURCE  = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
 HEIRLOOM_MAILX_SITE    = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
+HEIRLOOM_MAILX_LICENSE = BSD-4c, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPLv1.1 (nss)
+HEIRLOOM_MAILX_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 HEIRLOOM_MAILX_DEPENDENCIES += openssl
