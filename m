From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Jan 2015 17:37:03 +0100
Subject: [Buildroot] [PATCH 3/5] perl-mojolicious: bump to version 5.72
In-Reply-To: <1422031025-29533-1-git-send-email-francois.perrad@gadz.org>
References: <1422031025-29533-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1422031025-29533-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mojolicious/perl-mojolicious.hash | 3 +++
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/perl-mojolicious/perl-mojolicious.hash

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
new file mode 100644
index 0000000..a6d7703
--- /dev/null
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    797f28b188dec6e6a899b9b481ee8228 Mojolicious-5.72.tar.gz
+sha256 323218db02890a0b5e5d756f663ad32dbf312d05aa564b06d0a927e4a6a434d4 Mojolicious-5.72.tar.gz
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 1fa77b7..cb633d6 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 5.54
+PERL_MOJOLICIOUS_VERSION = 5.72
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_DEPENDENCIES = perl
-- 
2.1.0
