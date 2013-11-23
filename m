From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 23 Nov 2013 10:25:45 +0100
Subject: [Buildroot] [pkg-perl infra V3 08/12] host-libmodule-build-perl:
	new package
In-Reply-To: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
References: <1385198749-6249-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1385198749-6249-9-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the version coming with host-perl is too old

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../libmodule-build-perl/libmodule-build-perl.mk   |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/cpan/libmodule-build-perl/libmodule-build-perl.mk

diff --git a/package/cpan/libmodule-build-perl/libmodule-build-perl.mk b/package/cpan/libmodule-build-perl/libmodule-build-perl.mk
new file mode 100644
index 0000000..d874775
--- /dev/null
+++ b/package/cpan/libmodule-build-perl/libmodule-build-perl.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libmodule-build-perl
+#
+################################################################################
+
+LIBMODULE_BUILD_PERL_VERSION = 0.4200
+LIBMODULE_BUILD_PERL_AUTHOR = LEONT
+LIBMODULE_BUILD_PERL_SOURCE = Module-Build-$(LIBMODULE_BUILD_PERL_VERSION).tar.gz
+LIBMODULE_BUILD_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT/
+HOST_LIBMODULE_BUILD_PERL_DEPENDENCIES =
+
+$(eval $(host-perl-package))
-- 
1.7.9.5
