From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  7 Feb 2014 09:55:34 +0100
Subject: [Buildroot] [pkg-perl infra V5 5/8] host-perl-module-build: new
	package
In-Reply-To: <1391763337-30660-1-git-send-email-francois.perrad@gadz.org>
References: <1391763337-30660-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1391763337-30660-6-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the version coming with host-perl is too old

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-module-build/perl-module-build.mk |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/perl-module-build/perl-module-build.mk

diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
new file mode 100644
index 0000000..c726c2a
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
+PERL_MODULE_BUILD_LICENSE = perl_5
+
+$(eval $(host-perl-package))
-- 
1.7.9.5
