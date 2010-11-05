From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 10:27:37 +0100
Subject: [Buildroot] [git commit master 1/1] package/config: .gitignore
	cleanup
Message-ID: <20101105092848.A99798DBA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=09c1b8bd6e072746fa4696f0aba03042c854585c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now all configure generated files go to output directory.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/config/.gitignore |   24 ------------------------
 1 files changed, 0 insertions(+), 24 deletions(-)

diff --git a/package/config/.gitignore b/package/config/.gitignore
index 106bc12..2694c9a 100644
--- a/package/config/.gitignore
+++ b/package/config/.gitignore
@@ -1,28 +1,4 @@
 #
-# Generated files
-#
-config*
-lex.*.c
-*.tab.c
-*.tab.h
-zconf.hash.c
-*.moc
-lkc_defs.h
-gconf.glade.h
-*.pot
-*.mo
-
-#
-# configuration programs
-#
-conf
-mconf
-nconf
-qconf
-gconf
-kxgettext
-
-#
 # Quilt is being used to handle the patch series
 #
 .pc
-- 
1.7.1
