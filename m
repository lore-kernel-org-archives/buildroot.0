From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 22:57:39 +0200
Subject: [Buildroot] [git commit] package/reaver: replace utf-8 space by
 ascii character
Message-ID: <20190507210157.DAFD5815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87ff5666f4a1647c3b159571a871c0b4408741a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-#??while this one works right away
+# while this one works right away
 REAVER_VERSION = v1.6.5
 REAVER_SITE = $(call github,t6x,reaver-wps-fork-t6x,$(REAVER_VERSION))
 REAVER_LICENSE = GPL-2.0+
