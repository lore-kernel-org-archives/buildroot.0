From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jun 2014 23:19:53 +0200
Subject: [Buildroot] [git commit] perl-mojolicious: bump to version 5.08
Message-ID: <20140623215314.51C3A9D09B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd490c1fb22148a10b20c27cfd02b5f6d29f792b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- switch to BackPan in order to prevent build breakage
(like http://autobuild.buildroot.net/results/358/358f531f2db90b9bc3b1e4e2158c68d2bf6587fc/)
- add license file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-mojolicious/perl-mojolicious.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 2c713e6..4d0de5e 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 5.07
+PERL_MOJOLICIOUS_VERSION = 5.08
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
-PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI/
+PERL_MOJOLICIOUS_SITE = http://backpan.perl.org/authors/id/S/SR/SRI/
 PERL_MOJOLICIOUS_DEPENDENCIES = perl
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
+PERL_MOJOLICIOUS_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
