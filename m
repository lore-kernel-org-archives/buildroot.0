From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Nov 2016 23:28:25 +0100
Subject: [Buildroot] [git commit] docs/manual: fix typo
Message-ID: <20161129223029.B9E9081D4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf116466d2deb6c9f8f661c08142b43b0f4667e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove dangling reference to virtual package lists.

Signed-off-by: Lucile Quirion <lucile.quirion@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt | 3 ---
 docs/manual/customize-outside-br.txt      | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index a74761c..5dba962 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -384,9 +384,6 @@ openGL libraries.
 
 See xref:virtual-package-tutorial[] for more on the virtual packages.
 
-See xref:virtual-package-list[] for the symbols to depend on if your package
-depends on a feature provided by a virtual package.
-
 === The +.mk+ file
 
 [[adding-packages-mk]]
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 2ebb447..ea0e120 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -178,7 +178,7 @@ the br2-external tree. Buildroot will automatically show them in the
 output of +make list-defconfigs+ and allow them to be loaded with the
 normal +make <name>_defconfig+ command. They will be visible in the
 'make list-defconfigs' output, below an +External configs+ label that
-contains the name of the br2-extermnal tree they are defined in.
+contains the name of the br2-external tree they are defined in.
 
 .Note:
 If a defconfig file is present in more than one br2-external tree, then
