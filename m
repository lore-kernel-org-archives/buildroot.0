From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:36:19 +0200
Subject: [Buildroot] [git commit] package/makedumpfile: remove consecutive
 empty lines
Message-ID: <20200919123954.228E780467@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24ed3fef9d07ae5695cc631600eca421a21330b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

package/makedumpfile/makedumpfile.mk:24: consecutive empty lines

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/makedumpfile/makedumpfile.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 276f3f908c..c949af9f71 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -21,7 +21,6 @@ else
 MAKEDUMPFILE_TARGET = $(BR2_ARCH)
 endif
 
-
 define MAKEDUMPFILE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		$(MAKEDUMPFILE_MAKE_OPTS) TARGET=$(MAKEDUMPFILE_TARGET) LINKTYPE=dynamic
