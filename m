From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 13:30:21 +0100
Subject: [Buildroot] [git commit] docs/manual: fix typo in $(FOO_PKGDIR)
	documentation
Message-ID: <20151105123043.5331B7FC53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1daa4c95a4bb93621292dd5c9d24285fcddb4026
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
