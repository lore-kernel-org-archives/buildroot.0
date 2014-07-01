From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:56:52 +0200
Subject: [Buildroot] [git commit] lite: add license information
Message-ID: <20140701224922.1AAB79D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=37905bcd14f2140c6b70ebd0b638184c91ec0ec3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lite/lite.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/lite/lite.mk b/package/lite/lite.mk
index 1784d1f..ca971c1 100644
--- a/package/lite/lite.mk
+++ b/package/lite/lite.mk
@@ -11,6 +11,8 @@ LITE_INSTALL_STAGING = YES
 LITE_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 LITE_CONF_ENV = DFB_CFLAGS=-I$(STAGING_DIR)/usr/include/directfb
 LITE_DEPENDENCIES = directfb
+LITE_LICENSE = LGPLv2.1+
+LITE_LICENSE_FILES = COPYING
 
 define LITE_FINALIZE_INSTALL
 	$(INSTALL) -d $(TARGET_DIR)/usr/share/LiTE/examples/
