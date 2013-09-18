From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 13:15:46 +0200
Subject: [Buildroot] [git commit] trivial: manual: fix grammar of 'to
	express'
Message-ID: <20130918222318.7C55E9B7D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b143b6d01e61580d4b862c30d5f4c205e182a23f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-directory.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 6296596..aac1ced 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -65,7 +65,7 @@ rules:
   dependencies are selected. For example, the _libgtk2_ package uses
   +select BR2_PACKAGE_LIBGLIB2+ to make sure this library is also
   enabled.
-  The +select+ keyword express the dependency with a backward
+  The +select+ keyword expresses the dependency with a backward
   semantic.
 
 * Use a +depends on+ type of dependency when the user really needs to
@@ -77,7 +77,7 @@ rules:
   dependencies on toolchain options, there should be a +comment+ that
   is displayed when the option is not
   enabled, so that the user knows why the package is not available.
-  The +depends on+ keyword express the dependency with a forward
+  The +depends on+ keyword expresses the dependency with a forward
   semantic.
 
 .Note
