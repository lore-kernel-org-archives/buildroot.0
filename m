From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 19 Jan 2015 10:22:50 -0300
Subject: [Buildroot] [PATCH] radvd: add license info
Message-ID: <1421673770-521-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's BSD-4c with a few extras, so BSD-4c-like.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/radvd/radvd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 6b241b7..4daf9d7 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -11,6 +11,8 @@ RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
 RADVD_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 # We're patching configure.ac/Makefile.am.
 RADVD_AUTORECONF = YES
+RADVD_LICENSE = BSD-4c-like
+RADVD_LICENSE_FILES = COPYRIGHT
 
 define RADVD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/radvd/S50radvd $(TARGET_DIR)/etc/init.d/S50radvd
-- 
2.0.5
