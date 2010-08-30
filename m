From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 30 Aug 2010 15:21:53 +0200
Subject: [Buildroot] [PATCH] packages/atk: fix Makefile
Message-ID: <1283174513-10574-1-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>

Reported-by: "James J. Dines" <jdines@jdines.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/atk/atk.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 6f3a3b6..71937a9 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -41,7 +41,7 @@ ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
 		gl_cv_c_restrict=no ac_cv_prog_F77=no
 
 ATK_CONF_OPT =  --enable-shared \
-		--enable-static
+		--enable-static \
 		--disable-glibtest --enable-explicit-deps=no \
 		--disable-debug
 
-- 
1.7.1
