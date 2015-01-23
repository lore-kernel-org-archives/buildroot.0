From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Jan 2015 17:37:04 +0100
Subject: [Buildroot] [PATCH 4/5] perl-path-tiny: bump to version 0.061
In-Reply-To: <1422031025-29533-1-git-send-email-francois.perrad@gadz.org>
References: <1422031025-29533-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1422031025-29533-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-path-tiny/perl-path-tiny.hash | 3 +++
 package/perl-path-tiny/perl-path-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/perl-path-tiny/perl-path-tiny.hash

diff --git a/package/perl-path-tiny/perl-path-tiny.hash b/package/perl-path-tiny/perl-path-tiny.hash
new file mode 100644
index 0000000..7c3381d
--- /dev/null
+++ b/package/perl-path-tiny/perl-path-tiny.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    b82cb206a44b7408b11b991001c45e49 Path-Tiny-0.061.tar.gz
+sha256 e8290aac8c0623eea1b20b4a9d9a1be08db7f5a92ea51a514677964f3fa01cca Path-Tiny-0.061.tar.gz
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 4f34b8a..248e30c 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.059
+PERL_PATH_TINY_VERSION = 0.061
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_DEPENDENCIES = perl
-- 
2.1.0
