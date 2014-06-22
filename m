From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 23:15:57 +0200
Subject: [Buildroot] [PATCH] package/perl-mojolicious: bump to 5.08
Message-ID: <1403471757-19622-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Since CPAN only ever keeps the latest version for download, CPAN now has
only 5.08, so us packaging the 5.07 is causing autobuild failures:
    http://autobuild.buildroot.net/results/358/358f531f2db90b9bc3b1e4e2158c68d2bf6587fc/

Bump to the latest version.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Francois Perrad <fperrad@gmail.com>
---
 package/perl-mojolicious/perl-mojolicious.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 2c713e6..b7c33ac 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 5.07
+PERL_MOJOLICIOUS_VERSION = 5.08
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI/
 PERL_MOJOLICIOUS_DEPENDENCIES = perl
-- 
1.8.3.2
