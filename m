From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 13:49:44 +0200
Subject: [Buildroot] [git commit] package/moarvm: bump to version 2020.05
Message-ID: <20200606114919.D052383787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bbf9e414f8b9d4f0f73f3dd2978efe8797b7ab4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/moarvm/moarvm.hash | 4 ++--
 package/moarvm/moarvm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/moarvm/moarvm.hash b/package/moarvm/moarvm.hash
index 29c6ce77fd..05e21c0ea8 100644
--- a/package/moarvm/moarvm.hash
+++ b/package/moarvm/moarvm.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 82cb80b29ad7aebb0c0b42449d371eafa8935b07884526345f9788c8bcf4d632  MoarVM-2020.02.1.tar.gz
-sha256 c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
+sha256  9368d2c691ea8710459a48c323915df6648c4a67d2ce24c27fc74f6b084a824b  MoarVM-2020.05.tar.gz
+sha256  c53c6b96081b0a5b9b2fb4d0133d55c20e5e00e4c127ade62f03434ee7b3d2de  Artistic2.txt
diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index a0c7766bf0..4e8ca91904 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOARVM_VERSION = 2020.02.1
+MOARVM_VERSION = 2020.05
 MOARVM_SITE = http://moarvm.com/releases
 MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
