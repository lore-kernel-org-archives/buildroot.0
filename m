From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Nov 2016 22:34:21 +0100
Subject: [Buildroot] [git commit branch/next] patchelf: bump version to 0.9
Message-ID: <20161109213652.68DDB80DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2163fb8d4cc6ca925464b60b517e8953038559d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/patchelf/patchelf.hash | 2 +-
 package/patchelf/patchelf.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/patchelf/patchelf.hash b/package/patchelf/patchelf.hash
index 0da413e..14154a3 100644
--- a/package/patchelf/patchelf.hash
+++ b/package/patchelf/patchelf.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	14af06a2da688d577d64ff8dac065bb8903bbffbe01d30c62df7af9bf4ce72fe	patchelf-0.8.tar.gz
+sha256	f2aa40a6148cb3b0ca807a1bf836b081793e55ec9e5540a5356d800132be7e0a	patchelf-0.9.tar.gz
diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
index 043224d..5222e57 100644
--- a/package/patchelf/patchelf.mk
+++ b/package/patchelf/patchelf.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PATCHELF_VERSION = 0.8
-PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-0.8
+PATCHELF_VERSION = 0.9
+PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-0.9
 PATCHELF_LICENSE = GPLv3+
 PATCHELF_LICENSE_FILES = COPYING
 
