From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 13:07:39 +0200
Subject: [Buildroot] [PATCH 05/23 v5] docs/manual: get rid of legacy comment
	in GENDOC
In-Reply-To: <cover.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <ab02dccc595c1612712231c07231fc44e1b1258e.1410692670.git.yann.morin.1998@free.fr>
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
---
 docs/manual/manual.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index b5856b9..4825a70 100644
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
