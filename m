From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:08 -0300
Subject: [Buildroot] [PATCH 11/19] findutils: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/findutils/findutils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 464f28b..d9b6050 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -6,6 +6,8 @@
 
 FINDUTILS_VERSION = 4.4.2
 FINDUTILS_SITE = $(BR2_GNU_MIRROR)/findutils
+FINDUTILS_LICENSE = GPLv3+
+FINDUTILS_LICENSE_FILES = COPYING
 FINDUTILS_CONF_ENV = gl_cv_func_stdin=yes \
 			gl_cv_func_wcwidth_works=yes
 
-- 
1.8.1.5
