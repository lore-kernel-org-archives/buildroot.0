From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2015 20:38:46 +0100
Subject: [Buildroot] [git commit] manual: download: remove trailing slash
	from package FOO_SITE
Message-ID: <20150310194224.A12EE817FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bf03a81ba59ecd355b3ba2e97b331368a3451b92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The recommended form is without the trailing slash. Buildroot will add a slash
between FOO_SITE and FOO_SOURCE as appropriate.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index e3029ed..6150bf7 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -242,7 +242,7 @@ information is (assuming the package name is +libfoo+) :
   +LIBFOO_SITE+.
   Examples: +
     +LIBFOO_SITE=http://www.libfoosoftware.org/libfoo+ +
-    +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor/+ +
+    +LIBFOO_SITE=http://svn.xiph.org/trunk/Tremor+ +
     +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
     +LIBFOO_SITE=$(TOPDIR)/../src/libfoo/+
 
