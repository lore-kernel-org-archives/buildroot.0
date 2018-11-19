From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Nov 2018 08:51:13 +0100
Subject: [Buildroot] [git commit branch/2018.02.x]
 package/xproto_inputproto: disable documentation
Message-ID: <20181119074825.AE4C383A8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67de8b9d6d34c242f70820f7336d11144bacb7fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Resolves:
http://autobuild.buildroot.net/results/e6b/e6badde04047e10023b97946bbff434abc07344d/

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xproto_inputproto/xproto_inputproto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index 20169b5c46..5b3c63a588 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -11,6 +11,7 @@ XPROTO_INPUTPROTO_LICENSE = MIT
 XPROTO_INPUTPROTO_LICENSE_FILES = COPYING
 XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 XPROTO_INPUTPROTO_INSTALL_TARGET = NO
+XPROTO_INPUTPROTO_CONF_ENV = ac_cv_path_ASCIIDOC=""
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
