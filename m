From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu,  1 Dec 2016 21:41:52 -0500
Subject: [Buildroot] [PATCH 1/1] docs/manual: fix FOO_PKGDIR name and
	definition
Message-ID: <1480646512-2465-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Change "foo" references to "libfoo" in section that defines variables
explicitly stated to relate to a "libfoo" package.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 51408e8..0e111e1 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -528,8 +528,8 @@ endef
 
 In the action definitions, you can use the following variables:
 
-* +$(FOO_PKGDIR)+ contains the path to the directory containing the
-  +foo.mk+ and +Config.in+ files. This variable is useful when it is
+* +$(LIBFOO_PKGDIR)+ contains the path to the directory containing the
+  +libfoo.mk+ and +Config.in+ files. This variable is useful when it is
   necessary to install a file bundled in Buildroot, like a runtime
   configuration file, a splashscreen image...
 
-- 
1.9.1
