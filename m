From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 5 Nov 2015 00:10:50 +0100
Subject: [Buildroot] [PATCH] docs/manual: fix typo in $(FOO_PKGDIR)
	documentation
Message-ID: <1446678650-17966-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 02a43d6..1c25c4e 100644
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
