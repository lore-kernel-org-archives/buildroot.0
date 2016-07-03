From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:21:19 +0200
Subject: [Buildroot] [git commit] wayland: add explicit dependencies for
	host variant
Message-ID: <20160703072403.8D17981E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbb351a06af1e4f7a4b843884f74c5fd12a83639
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wayland/wayland.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index e219624..d4b4664 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -11,6 +11,7 @@ WAYLAND_LICENSE = MIT
 WAYLAND_LICENSE_FILES = COPYING
 WAYLAND_INSTALL_STAGING = YES
 WAYLAND_DEPENDENCIES = host-pkgconf host-wayland expat libffi libxml2
+HOST_WAYLAND_DEPENDENCIES = host-pkgconf host-expat host-libffi host-libxml2
 
 # wayland-scanner is only needed for building, not on the target
 WAYLAND_CONF_OPTS = --disable-scanner --with-host-scanner
