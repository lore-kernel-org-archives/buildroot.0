From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  5 Nov 2015 06:16:12 +0200
Subject: [Buildroot] [PATCH] docs/manual: fix typo
Message-ID: <794ec7651b02ea3faadc7e0a3f273148b7cdb6eb.1446696972.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 02a43d6b1d52..1c25c4e9f7b6 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -498,7 +498,7 @@ In the action definitions, you can use the following variables:
 * +$(FOO_PKGDIR)+ contains the path to the directory containing the
   +foo.mk+ and +Config.in+ files. This variable is useful when it is
   necessary to install a file bundled in Buildroot, like a runtime
-  configuration file, a splashscren image...
+  configuration file, a splashscreen image...
 
 * +$(@D)+, which contains the directory in which the package source
   code has been uncompressed.
-- 
2.6.2
