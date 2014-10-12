From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:26 +0200
Subject: [Buildroot] [git commit] docs/manual: get rid of legacy comment in
	GENDOC
Message-ID: <20141012072419.837EDB1B51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=552e0da90c3fc824da33520d3878046bac66d4b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since dd935d6 (gendoc infra: use $(pkgname) instead of explicitly
passing 'manual', the GENDOC infra no longer expect any argument.

Remove the stray comment.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index e9078f1..69113e3 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -124,9 +124,6 @@ endef
 ################################################################################
 # GENDOC -- generates the make targets needed to build asciidoc documentation.
 #
-#  argument 1 is the name of the document and must be a subdirectory of docs/;
-#             the top-level asciidoc file must have the same name
-#
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 ################################################################################
 define GENDOC
