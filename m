From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 18 Sep 2013 11:01:34 +0200
Subject: [Buildroot] [PATCH 1 of 4 RFC] trivial: manual: fix grammar of 'to
	express'
In-Reply-To: <patchbomb.1379494893@argentina>
References: <patchbomb.1379494893@argentina>
Message-ID: <9a789ed94d7b76b13ff9.1379494894@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-directory.txt |  4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
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
