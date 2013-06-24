From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 24 Jun 2013 10:40:54 +0200
Subject: [Buildroot] [PATCHv3 3/5] tcl: install the libtcl into staging
In-Reply-To: <1372063256-23292-1-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <1372063256-23292-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <1372063256-23292-4-git-send-email-richard.genoud@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tcl package contains a lib, so it should go into staging.

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 package/tcl/tcl.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index dbdb40f..83d74ec 100644
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
