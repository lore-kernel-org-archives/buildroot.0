From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 May 2016 09:33:02 +0200
Subject: [Buildroot] [git commit] libinput: fix variable name typo
Message-ID: <20160511073340.542BF81E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=718248385cc706a62d0b59780567eb59681581f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index d994d29..de6a81c 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -18,7 +18,7 @@ ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 LIBINPUT_CONF_OPTS += --enable-event-gui
 LIBINPUT_DEPENDENCIES += libgtk3
 else
-LIBINOUT_CONF_OPTS += --disable-event-gui
+LIBINPUT_CONF_OPTS += --disable-event-gui
 endif
 
 $(eval $(autotools-package))
