From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Apr 2020 22:19:02 +0200
Subject: [Buildroot] [git commit] package/webkitgtk: security bump to
 version 2.28.2
Message-ID: <20200426200453.691BE908BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=080f4251adef7594e5b17f43e75551f9f821300b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a minor release which provides fixes for CVE-2020-11793,
CVE-2020-3887, CVE-2020-3894, and CVE-2020-3899.

Updating from 2.28.0 also brings a few rendering fixes, a build fix
on MIPS64, a build fix for GStreamer 1.12, and solves a couple of
crashes. The full release notes covering 2.28.1 and 2.28.2 can be
found at:

  https://webkitgtk.org/2020/04/13/webkitgtk2.28.1-released.html
  https://webkitgtk.org/2020/04/24/webkitgtk2.28.2-released.html

A detailed security advisory can be found at:

  https://webkitgtk.org/security/WSA-2020-0004.html

Note that the above does not cover all the CVEs, and a new advisory
including them is expected to be published in the next days.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 1d79d34e27..a76cc925a1 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.28.0.tar.xz.sums
-md5  0bf11df8117ea64f6b8de59d278a2c78  webkitgtk-2.28.0.tar.xz
-sha1  927d0922b986fd06567015ce4425ed05d9fca209  webkitgtk-2.28.0.tar.xz
-sha256  361f3d178f62a9c112cbadfedd46106c34455c26d57a12a28fb3b09178d20e8b  webkitgtk-2.28.0.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.28.2.tar.xz.sums
+md5  ec0ef870ca37e3a5ebbead2f268a28ec  webkitgtk-2.28.2.tar.xz
+sha1  0aba97beba7b2677ed2d28aac51e429cb26c3fe6  webkitgtk-2.28.2.tar.xz
+sha256  b9d23525cfd8d22c37b5d964a9fe9a8ce7583042a2f8d3922e71e6bbc68c30bd  webkitgtk-2.28.2.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 2578847b05..2abb083fc6 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.28.0
+WEBKITGTK_VERSION = 2.28.2
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
