From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Oct 2016 19:59:18 +0200
Subject: [Buildroot] [git commit] zyre: disable docs
Message-ID: <20161025175932.533118199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15a6c8290a9d6976dc8a2b5b1330511392e36816
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.net/results/c30/c307cfae46b800603b76f623840bd0fd950f0e3f/

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zyre/zyre.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zyre/zyre.mk b/package/zyre/zyre.mk
index 8647456..e47da97 100644
--- a/package/zyre/zyre.mk
+++ b/package/zyre/zyre.mk
@@ -11,6 +11,7 @@ ZYRE_LICENSE_FILES = LICENSE
 ZYRE_INSTALL_STAGING = YES
 ZYRE_DEPENDENCIES = czmq zeromq host-pkgconf
 ZYRE_AUTORECONF = YES
+ZYRE_CONF_OPTS = --without-docs
 
 define ZYRE_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
