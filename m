From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  7 Apr 2019 21:58:28 +0200
Subject: [Buildroot] [PATCH 1/6] package/lldpd: update license file
Message-ID: <20190407195833.9275-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Instead of README.md, use LICENSE file that has been added in version
  0.9.5 with
  https://github.com/vincentbernat/lldpd/commit/4d534a60ee33aa2431acb6bfe6d499d2e72d66d5
- Add hash of license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
 
-- 
2.20.1
