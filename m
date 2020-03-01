From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Mar 2020 16:47:37 +0100
Subject: [Buildroot] [git commit branch/next] package/gensio: bump to
 version 1.5.3
Message-ID: <20200301153654.3CF168F09C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a4354218c556da19947b02c0445a42c8ddba35c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gensio/gensio.hash | 6 +++---
 package/gensio/gensio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index b63e459f16..202548bc40 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  eecceb741c34708deb8b29b7b84d5bd0  gensio-1.5.2.tar.gz
-sha1  4209ba80ecd1ead930ee8d9e60f384afd20481bd  gensio-1.5.2.tar.gz
+md5  d6b0665266f738973b13450c53d83032  gensio-1.5.3.tar.gz
+sha1  8d041babe8d29f8acb48c6cb0fa543e6f9f63238  gensio-1.5.3.tar.gz
 # Locally computed:
-sha256  9213b05bcab615fe5b9c5d71bb5fe765500271941980ba606904ffc5d0cd30fa  gensio-1.5.2.tar.gz
+sha256  f5097add3f269594e7a81016af93c147e8f5e8312f27f3d0bfbeeb3aad1ace53  gensio-1.5.3.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 5272c3c0d7..06e55875c0 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 1.5.2
+GENSIO_VERSION = 1.5.3
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
