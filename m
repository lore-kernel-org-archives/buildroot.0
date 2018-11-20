From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Nov 2018 11:40:36 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] xproto_inputproto: also
 disable asciidoc documentation for host builds
Message-ID: <20181120103834.2DC0B83CB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbd4966edf6900a11556b9cf2d30749a7c94ff68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:
http://autobuild.buildroot.net/results/0ff/0ff9a3a27984ad91aa33079143bb87ed71bfe7c4/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xproto_inputproto/xproto_inputproto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xproto_inputproto/xproto_inputproto.mk b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
index 5b3c63a588..9e45e2d30a 100644
--- a/package/x11r7/xproto_inputproto/xproto_inputproto.mk
+++ b/package/x11r7/xproto_inputproto/xproto_inputproto.mk
@@ -12,6 +12,7 @@ XPROTO_INPUTPROTO_LICENSE_FILES = COPYING
 XPROTO_INPUTPROTO_INSTALL_STAGING = YES
 XPROTO_INPUTPROTO_INSTALL_TARGET = NO
 XPROTO_INPUTPROTO_CONF_ENV = ac_cv_path_ASCIIDOC=""
+HOST_XPROTO_INPUTPROTO_CONF_ENV = ac_cv_path_ASCIIDOC=""
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
