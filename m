From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 21:20:56 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/lldpd: update
 license file
Message-ID: <20190424191657.21C70814AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56e57b144f4375ecb04f8f9f11234fffcd35aeef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

- Instead of README.md, use LICENSE file that has been added in version
  0.9.5 with
  https://github.com/vincentbernat/lldpd/commit/4d534a60ee33aa2431acb6bfe6d499d2e72d66d5
- Add hash of license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d86eb0c8b4be9f68cbd9ac17edc39b909a6427ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lldpd/lldpd.hash | 1 +
 package/lldpd/lldpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/lldpd/lldpd.hash b/package/lldpd/lldpd.hash
index 1785197737..1c0e380996 100644
--- a/package/lldpd/lldpd.hash
+++ b/package/lldpd/lldpd.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256 450b622aac7ae1758f1ef82f3b7b94ec47f2ff33abfb0e6ac82555b9ee55f151  lldpd-1.0.1.tar.gz
+sha256 0e96a5aea65f16e2239231ce4ab90497f8bc3bb8fe6abe9299aade4726ff7c8d  LICENSE
diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 6a520448da..8d554ae5e2 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -8,7 +8,7 @@ LLDPD_VERSION = 1.0.1
 LLDPD_SITE = http://media.luffy.cx/files/lldpd
 LLDPD_DEPENDENCIES = host-pkgconf libevent
 LLDPD_LICENSE = ISC
-LLDPD_LICENSE_FILES = README.md
+LLDPD_LICENSE_FILES = LICENSE
 # 0002-configure-do-not-check-for-libbsd.patch / 0003-configure-remove-check-on-CXX-compiler.patch
 LLDPD_AUTORECONF = YES
 
