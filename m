From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Oct 2014 19:01:38 +0200
Subject: [Buildroot] [PATCH 04/25 v7] docs/manual: get rid of legacy comment
	in GENDOC
In-Reply-To: <cover.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <4ea66881e24732745c333e551876a1f38bf18119.1412355549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since dd935d6 (gendoc infra: use $(pkgname) instead of explicitly
passing 'manual', the GENDOC infra no longer expect any argument.

Remove the stray comment.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk | 3 ---
 1 file changed, 3 deletions(-)

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
-- 
1.9.1
