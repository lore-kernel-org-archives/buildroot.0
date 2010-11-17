From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 17 Nov 2010 07:27:11 +0100
Subject: [Buildroot] [git commit master 1/1] libglib2: ensure atomic ops
	patch gets applied
Message-ID: <20101117062750.CF5448DC27@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dfbb3893754c8b992970189d5a28cd7f95121672
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2809

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |   10 ++++++++++
 ...2-fix-compilation-with-no-builtin-atomic.patch} |    0
 2 files changed, 10 insertions(+), 0 deletions(-)
 rename package/libglib2/{libglib-2.26.0-fix-compilation-with-no-builtin-atomic.patch => libglib2-fix-compilation-with-no-builtin-atomic.patch} (100%)

diff --git a/CHANGES b/CHANGES
index bc3e944..bee6f33 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,13 @@
+2010.11, Not yet released:
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: libglib2
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#2809: failed to compile libglib2
+
 2010.11-rc1, Released November 8th, 2010:
 
 	Fixes all over the tree and new features.
diff --git a/package/libglib2/libglib-2.26.0-fix-compilation-with-no-builtin-atomic.patch b/package/libglib2/libglib2-fix-compilation-with-no-builtin-atomic.patch
similarity index 100%
rename from package/libglib2/libglib-2.26.0-fix-compilation-with-no-builtin-atomic.patch
rename to package/libglib2/libglib2-fix-compilation-with-no-builtin-atomic.patch
-- 
1.7.1
