From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:25 +0200
Subject: [Buildroot] [PATCH 03/16] gsl: handle gsl-config script
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gsl/gsl.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 6591591..ef426cf 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -9,6 +9,7 @@ GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPLv3
 GSL_LICENSE_FILES = COPYING
+GSL_CONFIG_SCRIPTS = gsl-config
 
 # uClibc pretends to have fenv support as it installs <fenv.h>, but in
 # practice, it only implements it for i386. Problem reported upstream
-- 
1.7.9.5
