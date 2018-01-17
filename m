From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 17 Jan 2018 18:45:14 +0100
Subject: [Buildroot] [PATCH 08/14] perl-mojolicious: bump to version 7.61
In-Reply-To: <20180117174520.29545-1-francois.perrad@gadz.org>
References: <20180117174520.29545-1-francois.perrad@gadz.org>
Message-ID: <20180117174520.29545-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index 45bfd5ac5..0593a3cc6 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a07d9d3fc06a35cc7336b35e6e531e43 Mojolicious-7.43.tar.gz
-sha256 ca177da7b0c1e2a31a1880c4a06afbbd1ada1da57146bfa030b7912a3d608b5e Mojolicious-7.43.tar.gz
+md5    47d198ea987b4913818c24107cd9673d Mojolicious-7.61.tar.gz
+sha256 386ade41021bf0470879a0abceeccc305f773b41b76245cc3cdce92d7dc8897d Mojolicious-7.61.tar.gz
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index b3bec15e6..4e94c47a7 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 7.43
+PERL_MOJOLICIOUS_VERSION = 7.61
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.11.0
