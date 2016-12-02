From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 21:40:36 +0100
Subject: [Buildroot] [git commit] docs/manual: fix FOO_PKGDIR name and
	definition
Message-ID: <20161202204056.D673281D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c3dd221c6f829af4194c2b38d192bc82699c0d7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change "foo" references to "libfoo" in section that defines variables
explicitly stated to relate to a "libfoo" package.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
