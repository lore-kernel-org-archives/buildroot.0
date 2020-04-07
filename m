From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 20:48:21 +0200
Subject: [Buildroot] [git commit branch/2019.11.x] docs/manual: small typo
 fixes and cleanup
Message-ID: <20200407183907.07B0B8D5F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d3c031d6f707b953a0af1a18ea10bfb728cd698e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fix a few punctuation mistakes. The removed link is redundant, see the
previous sentence.

Signed-off-by: Merlin B??ge <merlin.buege@tuhh.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 20bd811c7ed5240d6eccde918161222de3bb6b4d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.txt      | 2 +-
 docs/manual/customize-patches.txt | 2 +-
 docs/manual/customize-rootfs.txt  | 2 +-
 docs/manual/writing-rules.txt     | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index a87980d4a2..cd3d4afd6e 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -88,7 +88,7 @@ to +make+ or set in the environment:
   Buildroot stores the cached files when using ccache.
   +
 * +BR2_DL_DIR+ to override the directory in which
-  Buildroot stores/retrieves downloaded files
+  Buildroot stores/retrieves downloaded files.
   +
   Note that the Buildroot download directory can also be set from the
   configuration interface, so through the Buildroot +.config+ file. See
diff --git a/docs/manual/customize-patches.txt b/docs/manual/customize-patches.txt
index fa63541110..eb98d1bea2 100644
--- a/docs/manual/customize-patches.txt
+++ b/docs/manual/customize-patches.txt
@@ -53,7 +53,7 @@ directory.
 The exception to +BR2_GLOBAL_PATCH_DIR+ being the preferred method for
 specifying custom patches is +BR2_LINUX_KERNEL_PATCH+.
 +BR2_LINUX_KERNEL_PATCH+ should be used to specify kernel patches that
-are available at an URL. *Note:* +BR2_LINUX_KERNEL_PATCH+ specifies kernel
+are available at a URL. *Note:* +BR2_LINUX_KERNEL_PATCH+ specifies kernel
 patches that are applied after patches available in +BR2_GLOBAL_PATCH_DIR+,
 as it is done from a post-patch hook of the Linux package.
 
diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 6b72a37b32..e1dbadda5b 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -145,7 +145,7 @@ It is recommended to use the existing mechanisms to set file permissions
 The difference between post-build scripts (above) and fakeroot scripts,
   is that post-build scripts are not called in the fakeroot context.
 +
-.Note;
+.Note:
 Using `fakeroot` is not an absolute substitute for actually being root.
   `fakeroot` only ever fakes the file access rights and types (regular,
   block-or-char device...) and uid/gid; these are emulated in-memory.
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index ca43272287..3b809d5c48 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -141,8 +141,8 @@ endif
 The documentation uses the
 http://www.methods.co.nz/asciidoc/[asciidoc] format.
 
-For further details about the http://www.methods.co.nz/asciidoc/[asciidoc]
-syntax, refer to http://www.methods.co.nz/asciidoc/userguide.html[].
+For further details about the asciidoc syntax, refer to
+http://www.methods.co.nz/asciidoc/userguide.html[].
 
 === Support scripts
 
