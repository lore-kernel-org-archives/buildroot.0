From: richard.genoud at gmail.com <richard.genoud@gmail.com>
Date: Fri, 21 Jun 2013 13:57:00 +0200
Subject: [Buildroot] [PATCH 4/6] tcl: install the libtcl into staging
In-Reply-To: <1371815822-29453-1-git-send-email-y>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <1371815822-29453-1-git-send-email-y>
Message-ID: <51c43fa2.ebbbb40a.0abf.ffffba15@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Richard Genoud <richard.genoud@gmail.com>

The tcl package contains a lib, so it should go into staging.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/tcl/tcl.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index a927a02..90989d0 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -12,6 +12,7 @@ TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION_MAJOR)
 TCL_LICENSE = tcl license
 TCL_LICENSE_FILES = license.terms
 TCL_SUBDIR = unix
+TCL_INSTALL_STAGING = YES
 TCL_CONF_OPT = \
 		--disable-symbols \
 		--disable-langinfo \
-- 
1.7.10.4
