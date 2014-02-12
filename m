From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 12 Feb 2014 09:14:29 +0100
Subject: [Buildroot] [pkg-perl infra V9 4/6] host-perl-module-build: new
	package
In-Reply-To: <1392192871-426-1-git-send-email-francois.perrad@gadz.org>
References: <1392192871-426-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1392192871-426-5-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the version coming with host-perl is too old

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/perl-module-build/perl-module-build.mk |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/perl-module-build/perl-module-build.mk

diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
new file mode 100644
index 0000000..a95278d
--- /dev/null
+++ b/package/perl-module-build/perl-module-build.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-module-build
+#
+################################################################################
+
+PERL_MODULE_BUILD_VERSION = 0.4204
+PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
+PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT/
+PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
+
+$(eval $(host-perl-package))
-- 
1.7.9.5
