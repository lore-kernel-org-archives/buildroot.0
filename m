From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 22:38:07 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/webkitgtk:
 security bump to version 2.22.5
Message-ID: <20181216213405.C6BD08D5B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf13e303930488affdadb1a1736b127ef9232fc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

This is a maintenance release of the current stable WebKitGTK+ version,
which contains security fixes for CVE identifiers: CVE-2018-4437,
CVE-2018-4438, CVE-2018-4441, CVE-2018-4442, CVE-2018-4443, and
CVE-2018-4464. Additionally, it fixes a couple of build failures in
unusual build configurations.

Release notes can be found in the announcement:

  https://webkitgtk.org/2018/12/13/webkitgtk2.22.5-released.html

More details on the issues covered by security fixes can be found
in the corresponding security advisory:

  https://webkitgtk.org/security/WSA-2018-0009.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6bbfaf1d400417b7555fd0c67617cc25c7cc7b68)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 15b1b56681..4cdefa75b7 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.22.4.tar.xz.sums
-md5 9f08d09cfc21c761a431a545549f301a webkitgtk-2.22.4.tar.xz
-sha1 adf857c8a8b8fb79ba9b01bbe4b454956e633952 webkitgtk-2.22.4.tar.xz
-sha256 fab5be2883802352ae0e735dd1eff4bc18abaff7ac78689cec72eb2f611943b8 webkitgtk-2.22.4.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.22.5.tar.xz.sums
+md5 96a731522b800f38e70f85c22f8de477 webkitgtk-2.22.5.tar.xz
+sha1 809b067a1672a81a4ce31363a0872c668cc72953 webkitgtk-2.22.5.tar.xz
+sha256 99d3863f418a7c3a3e37e5062950dbf2d91fb106ec1633459b0ef6f2d5f6cb13 webkitgtk-2.22.5.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index cade28f99b..17984be21c 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.22.4
+WEBKITGTK_VERSION = 2.22.5
 WEBKITGTK_SITE = http://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
