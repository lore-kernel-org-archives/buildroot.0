From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 13:50:22 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/ghostscript: bump
 to version 9.53.3
Message-ID: <20201222140146.E5848815F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7780b5ba07717a5cbbe4a9a31beb1bc045338e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

https://www.ghostscript.com/doc/9.53.3/News.htm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d1c5397e9e7576ededb25c6d48b45f5783977615)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 143b28014d..f6cedc6198 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9532/SHA512SUMS
-sha512  73aa6013aeecbd1345317a40349089a2f19a2205fc11b8ca0b619df1e91f2ca8b03efc09be9e079cb5ab8e1b838aa2236349cd1c177217c14308242f99138ae4  ghostscript-9.53.2.tar.gz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9533/SHA512SUMS
+sha512  c142ef9d83896aa8fd18c8e412220fe8f4950614be00d327d27ab051fe85e16524bf2ee00f46c2aca7a352ce47bc3acf2c4de0f7bbea7e4c55474b8af6cdc0a6  ghostscript-9.53.3.tar.gz
 
 # Hash for license file:
 sha256  6f852249f975287b3efd43a5883875e47fa9f3125e2f1b18b5c09517ac30ecf2  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index e8d35a50bc..e6842631f2 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 9.53.2
+GHOSTSCRIPT_VERSION = 9.53.3
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
 GHOSTSCRIPT_LICENSE_FILES = LICENSE
