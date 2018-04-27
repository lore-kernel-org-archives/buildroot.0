From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Apr 2018 22:50:06 +0200
Subject: [Buildroot] [git commit] libsigrokdecode: bump version to 0.5.1
Message-ID: <20180427205009.9B54088ECC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7aed10486cdece04fff762bd23e32dc03e69b881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add a license hash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsigrokdecode/libsigrokdecode.hash | 3 ++-
 package/libsigrokdecode/libsigrokdecode.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libsigrokdecode/libsigrokdecode.hash b/package/libsigrokdecode/libsigrokdecode.hash
index a4914b2592..c2e15f61cb 100644
--- a/package/libsigrokdecode/libsigrokdecode.hash
+++ b/package/libsigrokdecode/libsigrokdecode.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	4aa8579ecea9b421b8ac048a9b18c27e63206839f269374398d89c14a47bd1c1	libsigrokdecode-0.5.0.tar.gz
+sha256	493d8b555ae4c245a5feebbd94de33aec7ee85a4f16bc3f4c3985961b459b51e  libsigrokdecode-0.5.1.tar.gz
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libsigrokdecode/libsigrokdecode.mk b/package/libsigrokdecode/libsigrokdecode.mk
index 95e6e69af3..8b4802a7f3 100644
--- a/package/libsigrokdecode/libsigrokdecode.mk
+++ b/package/libsigrokdecode/libsigrokdecode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSIGROKDECODE_VERSION = 0.5.0
+LIBSIGROKDECODE_VERSION = 0.5.1
 LIBSIGROKDECODE_SITE = http://sigrok.org/download/source/libsigrokdecode
 LIBSIGROKDECODE_LICENSE = GPL-3.0+
 LIBSIGROKDECODE_LICENSE_FILES = COPYING
