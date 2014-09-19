From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Fri, 19 Sep 2014 09:13:50 +0200
Subject: [Buildroot] [PATCH] swig : bump to version 2.0.12
In-Reply-To: <1411110831-27676-1-git-send-email-jeremy.rosen@openwide.fr>
References: <1411110831-27676-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <1411110831-27676-2-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 package/swig/swig.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 79839ea..5efc81c 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-SWIG_VERSION = 2.0.10
+SWIG_MAJOR = 2.0
+SWIG_VERSION = $(SWIG_MAJOR).12
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 SWIG_DEPENDENCIES = host-bison
 HOST_SWIG_CONF_OPT = \
-- 
2.1.0
