From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 26 Oct 2014 09:12:54 +0100
Subject: [Buildroot] [PATCH 6/6] perl-mojolicious: bump to version 5.54
In-Reply-To: <1414311174-28291-1-git-send-email-francois.perrad@gadz.org>
References: <1414311174-28291-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1414311174-28291-6-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mojolicious/perl-mojolicious.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 5dc1135..1fa77b7 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 5.21
+PERL_MOJOLICIOUS_VERSION = 5.54
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_DEPENDENCIES = perl
-- 
1.9.1
