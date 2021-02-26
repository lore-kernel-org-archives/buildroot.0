From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Feb 2021 23:47:00 +0100
Subject: [Buildroot] [git commit branch/next] package/tar: bump version to
 1.34
Message-ID: <20210226223015.2773583849@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27fffea6db7358af20f5a3a8faa174d3b782d61f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump the version of tar to 1.34 for host and target.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tar/tar.hash | 4 ++--
 package/tar/tar.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tar/tar.hash b/package/tar/tar.hash
index 72f0cd6fcb..1914a9f3b4 100644
--- a/package/tar/tar.hash
+++ b/package/tar/tar.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-sha256  d0d3ae07f103323be809bc3eac0dcc386d52c5262499fe05511ac4788af1fdd8  tar-1.32.tar.xz
-sha256  9fbfba0cba05233421dd619b8825e1ceb7c144e433c15ae48b68f17ede8d404a  tar-1.32.cpio.gz
+sha256  63bebd26879c5e1eea4352f0d03c991f966aeb3ddeb3c7445c902568d5411d28  tar-1.34.tar.xz
+sha256  51337b19c71df92cd4f51c50efe4dc6ddc267d31fd54679be9e9bc2e6ce8132b  tar-1.34.cpio.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 2da731f80a..690a5952ba 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAR_VERSION = 1.32
+TAR_VERSION = 1.34
 TAR_SOURCE = tar-$(TAR_VERSION).tar.xz
 TAR_SITE = $(BR2_GNU_MIRROR)/tar
 # busybox installs in /bin, so we need tar to install as well in /bin
