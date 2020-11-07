From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 13:21:15 +0100
Subject: [Buildroot] [git commit] package/kmscube: add license file
Message-ID: <20201107120801.9A1E383598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bb2a9c3601d4ca665af731a92a9db38f113608d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmscube/kmscube.hash | 1 +
 package/kmscube/kmscube.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/kmscube/kmscube.hash b/package/kmscube/kmscube.hash
index 6a4140c541..cb7abd48ea 100644
--- a/package/kmscube/kmscube.hash
+++ b/package/kmscube/kmscube.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  ec135069d8bee7f4fe38cb9dc96fbbd56e0057290fa25eff8b5b314ee473c502  kmscube-4660a7dca6512b6e658759d00cff7d4ad2a2059d.tar.gz
+sha256  f622099ab0d274133f6e62d5fccfe970b61134d80ed036f45f8cf1e90c3d5a05  COPYING
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index dc8c691864..7b458376dc 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -7,6 +7,7 @@
 KMSCUBE_VERSION = 4660a7dca6512b6e658759d00cff7d4ad2a2059d
 KMSCUBE_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)
 KMSCUBE_LICENSE = MIT
+KMSCUBE_LICENSE_FILES = COPYING
 KMSCUBE_DEPENDENCIES = host-pkgconf mesa3d libdrm
 
 $(eval $(meson-package))
