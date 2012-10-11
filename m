From: Alexander Khryukin <alexander@mezon.ru>
Date: Thu, 11 Oct 2012 15:07:35 +0000
Subject: [Buildroot] [PATCH] findutils version update 4.5.10
Message-ID: <1349968055-641-1-git-send-email-alexander@mezon.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/findutils/findutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 43aef75..ffc7327 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -4,8 +4,8 @@
 #
 #############################################################
 
-FINDUTILS_VERSION = 4.4.2
-FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
+FINDUTILS_VERSION = 4.5.10
+FINDUTILS_SITE = http://alpha.gnu.org/gnu/findutils
 FINDUTILS_CONF_ENV = gl_cv_func_stdin=yes \
 			gl_cv_func_wcwidth_works=yes
 
-- 
1.7.11.3
