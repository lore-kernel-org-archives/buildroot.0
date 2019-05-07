From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:26 +0200
Subject: [Buildroot] [PATCH v1 06/28] package/reaver: replace utf-8 space by
 ascii character
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/reaver/reaver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/reaver/reaver.mk b/package/reaver/reaver.mk
index 328a5c76a3..42b2aaa955 100644
--- a/package/reaver/reaver.mk
+++ b/package/reaver/reaver.mk
@@ -5,7 +5,7 @@
 ################################################################################

 # Older repos for this project will not cross-compile easily
-#?while this one works right away
+# while this one works right away
 REAVER_VERSION = v1.6.5
 REAVER_SITE = $(call github,t6x,reaver-wps-fork-t6x,$(REAVER_VERSION))
 REAVER_LICENSE = GPL-2.0+
--
2.21.0
