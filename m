From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Thu, 04 Nov 2010 11:00:14 +0200
Subject: [Buildroot] [PATCH RESEND] package/config: .gitignore cleanup
Message-ID: <20101104090013.31541.33883.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now all configure generated files go to output directory.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
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
