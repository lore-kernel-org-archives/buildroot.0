From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 18 Apr 2015 17:51:41 -0300
Subject: [Buildroot] [PATCH] vala: requires host-bisonn
Message-ID: <1429390301-24015-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vala/vala.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vala/vala.mk b/package/vala/vala.mk
index 292ea7e..573e1e4 100644
--- a/package/vala/vala.mk
+++ b/package/vala/vala.mk
@@ -11,7 +11,7 @@ VALA_SOURCE = vala-$(VALA_VERSION).tar.xz
 VALA_LICENSE = LGPLv2.1+
 VALA_LICENSE_FILES = COPYING
 
-HOST_VALA_DEPENDENCIES = host-flex host-libglib2
+HOST_VALA_DEPENDENCIES = host-bison host-flex host-libglib2
 # Yes, the autoconf script understands ':' as "xsltproc is not
 # available".
 HOST_VALA_CONF_ENV = ac_cv_path_XSLTPROC=:
-- 
2.0.5
