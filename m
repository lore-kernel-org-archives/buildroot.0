From: Nigel Kukard <nkukard@lbsd.net>
Date: Wed,  5 Aug 2009 11:32:47 +0000
Subject: [Buildroot] [PATCH 1/1] Update popt to version 1.15
In-Reply-To: <cover.1249471947.git.nkukard@lbsd.net>
References: <cover.1249471947.git.nkukard@lbsd.net>
Message-ID: <87002cc7049ca3770a30d0fded384cd58cbe5547.1249471947.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
---
 package/popt/popt.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 3c0ab0b..4c57028 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -3,11 +3,13 @@
 # popt
 #
 #############################################################
-POPT_VERSION:=1.14
+POPT_VERSION:=1.15
 POPT_SITE:=http://rpm5.org/files/popt
 POPT_INSTALL_STAGING = YES
 POPT_INSTALL_TARGET = YES
 
+POPT_LIBTOOL_PATCH = NO
+
 POPT_CONF_ENV = ac_cv_va_copy=yes
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
-- 
1.6.4
