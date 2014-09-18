From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 18 Sep 2014 21:39:34 +0200
Subject: [Buildroot] [PATCH 11 of 13] manual/user guide/customization: refer
 to dir structure from rootfs section
In-Reply-To: <patchbomb.1411069163@localhost>
References: <patchbomb.1411069163@localhost>
Message-ID: <2e440272ce60d72bbb2a.1411069174@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This small patch adds references to the section on 'recommended directory
structure' from sections explaining the post-build script and rootfs
overlay.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/customize-rootfs.txt |  6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -21,6 +21,9 @@
   directories of version control systems, like +.git+, +.svn+, +.hg+,
   etc., files called +.empty+ and files ending in +~+ are excluded from
   the copy.
++
+As shown in xref:customize-dir-structure[], the recommended path for
+  this overlay is +board/<company>/<boardname>/rootfs-overlay+.
 
 Post-build scripts (+BR2_ROOTFS_POST_BUILD_SCRIPT+)::
 +
@@ -37,6 +40,9 @@
   files, you should fix that package rather than work around it with some
   post-build cleanup scripts.
 +
+As shown in xref:customize-dir-structure[], the recommended path for
+  this script is +board/<company>/<boardname>/post_build.sh+.
++
 The post-build scripts are run with the main Buildroot tree as current
   working directory. The path to the target filesystem is passed as the
   first argument to each script. If the config option
