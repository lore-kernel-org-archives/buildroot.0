From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  9 Mar 2015 23:14:50 +0100
Subject: [Buildroot] [PATCH 1/3] manual: download: remove trailing slash
	from package FOO_SITE
In-Reply-To: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net>
References: <1425939292-14719-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1425939292-14719-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The recommended form is without the trailing slash. Buildroot will add a slash
between FOO_SITE and FOO_SOURCE as appropriate.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 docs/manual/adding-packages-generic.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
 
-- 
1.9.1
