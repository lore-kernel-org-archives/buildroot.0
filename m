From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 19:02:39 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] package/webkitgtk: bump
 to version 2.22.4
Message-ID: <20181126175927.014628886E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e951e2a3cdd7c9ca629f5ff801da595c6d61c379
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

This is a maintenance release of the current stable WebKitGTK+ version,
which contains security fixes for  CVE-2018-4345, CVE-2018-4372,
CVE-2018-4373, CVE-2018-4375, CVE-2018-4376, CVE-2018-4378,
CVE-2018-4382, CVE-2018-4386, CVE-2018-4392, and CVE-2018-4416.
Additionally, it fixes a few build failures, and a crash when using
certain version of Cairo.

Release notes can be found in the announcement:

  https://webkitgtk.org/2018/11/21/webkitgtk2.22.4-released.html

More details on the issues covered by security fixes can be found
in the corresponding security advisory:

  https://webkitgtk.org/security/WSA-2018-0008.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7a827a17dc03f2ab4affc63a27b32aa5ca573da3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 19f0c487dd..15b1b56681 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.22.3.tar.xz.sums
-md5 6dae6837c884a25413fb1d4527c9894a webkitgtk-2.22.3.tar.xz
-sha1 c16129f4098b35597457255e63e60126ff3e6daa webkitgtk-2.22.3.tar.xz
-sha256 9dfd542902953be9af8ff32bd37fe662ca3d75f7348514ebac15c6252a6ccd72 webkitgtk-2.22.3.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.22.4.tar.xz.sums
+md5 9f08d09cfc21c761a431a545549f301a webkitgtk-2.22.4.tar.xz
+sha1 adf857c8a8b8fb79ba9b01bbe4b454956e633952 webkitgtk-2.22.4.tar.xz
+sha256 fab5be2883802352ae0e735dd1eff4bc18abaff7ac78689cec72eb2f611943b8 webkitgtk-2.22.4.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 8fed156a20..cade28f99b 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.22.3
+WEBKITGTK_VERSION = 2.22.4
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
