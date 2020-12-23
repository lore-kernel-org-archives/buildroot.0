From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 09:31:52 +0100
Subject: [Buildroot] [git commit] package/libdrm: add license file
Message-ID: <20201223085640.D239181540@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8def685b46f92fdda649a6fefe774d4be601f30e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add xf86drm.c as the license file and while at it, update the indentation
in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdrm/libdrm.hash | 7 +++++--
 package/libdrm/libdrm.mk   | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 84caffc792..b6a62d4c18 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,3 +1,6 @@
 # From https://lists.freedesktop.org/archives/dri-devel/2020-November/285471.html
-sha256 3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222  libdrm-2.4.103.tar.xz
-sha512 15b098b962008271400692b6b15ecb7e22676f8698e0220ad969735ac2315ccc737d19558afb6abda82bae15117e5f306c048184a2369f434b85ecaa670ca885  libdrm-2.4.103.tar.xz
+sha256  3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222  libdrm-2.4.103.tar.xz
+sha512  15b098b962008271400692b6b15ecb7e22676f8698e0220ad969735ac2315ccc737d19558afb6abda82bae15117e5f306c048184a2369f434b85ecaa670ca885  libdrm-2.4.103.tar.xz
+
+# Hash for license file
+sha256  2ece103921b7b5619198b9572fb9242db7bbfa6d3b33f9f93f22e1fb738ed8ac  xf86drm.c
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 0c332a4a9c..0ff30ee53e 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -8,6 +8,7 @@ LIBDRM_VERSION = 2.4.103
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
+LIBDRM_LICENSE_FILES = xf86drm.c
 LIBDRM_INSTALL_STAGING = YES
 
 LIBDRM_DEPENDENCIES = \
