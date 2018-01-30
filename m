From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Jan 2018 13:12:15 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] webkitgtk: security bump
 to version 2.18.5
Message-ID: <20180130122144.8161F8809F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10e19971c622b5c2ee65f2c5b334ea2cb1941b82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

This is a maintenance release of the current stable WebKitGTK+ version,
which contains mitigations for CVE-2017-5753 and CVE-2017-5715, the
vulnerabilities known as the "Spectre" attack. It also contains a fix
which allows building the reference documentation with newer gtk-doc
versions.

Release notes can be found in the announcement:

  https://webkitgtk.org/2018/01/10/webkitgtk2.18.5-released.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4c5bc08ba3198075dcf6f96b34684d577cfe5a69)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 3d64b6f5a9..0eeaca506f 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.18.4.tar.xz.sums
-md5 c4686971eac2760bab685e21ac8849be webkitgtk-2.18.4.tar.xz
-sha1 709616b445158dc3163a64bb59e95aadbe58949c webkitgtk-2.18.4.tar.xz
-sha256 87b6bb9a6065b949ecbe6191313c43e57ad28efdf1f2b5e763405093520632b8 webkitgtk-2.18.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.18.5.tar.xz.sums
+md5 af18c2cfa00cadfd0b4d8db21cab011d webkitgtk-2.18.5.tar.xz
+sha1 5f36db464f6b7bbe6a57e55bc9bb172f87a4c398 webkitgtk-2.18.5.tar.xz
+sha256 0c6d80cc7eb5d32f8063041fa11a1a6f17a29765c2f69c6bc862cd47c2d539b8 webkitgtk-2.18.5.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 00f7920a5f..d15382c0c5 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.18.4
+WEBKITGTK_VERSION = 2.18.5
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
