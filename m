From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 22 Jan 2021 19:30:16 +0100
Subject: [Buildroot] [PATCH 06/10] package/perl-params-util: bump to version
 1.102
In-Reply-To: <20210122183020.874889-1-francois.perrad@gadz.org>
References: <20210122183020.874889-1-francois.perrad@gadz.org>
Message-ID: <20210122183020.874889-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-params-util/perl-params-util.hash | 4 ++--
 package/perl-params-util/perl-params-util.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-params-util/perl-params-util.hash b/package/perl-params-util/perl-params-util.hash
index d43b8baff..b0461372b 100644
--- a/package/perl-params-util/perl-params-util.hash
+++ b/package/perl-params-util/perl-params-util.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  eaf000a27bbd21abfd55f83473ab79fd  Params-Util-1.101.tar.gz
-sha256  97f391bc092b9c911e4536d103afd48058eb1f8a53d729af7adb65430eb338b7  Params-Util-1.101.tar.gz
+md5  f1aa70ba570f03f14cd394096b9c6883  Params-Util-1.102.tar.gz
+sha256  499bb1b482db24fda277a51525596ad092c2bd51dd508fa8fec2e9f849097402  Params-Util-1.102.tar.gz
 
 # computed by scancpan
 sha256  08c2ed7589aff3b2076b48b792078d3479c2295559ee7bc4615e93abe0473939  ARTISTIC-1.0
diff --git a/package/perl-params-util/perl-params-util.mk b/package/perl-params-util/perl-params-util.mk
index 1a48a46fe..8c2a960c4 100644
--- a/package/perl-params-util/perl-params-util.mk
+++ b/package/perl-params-util/perl-params-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PARAMS_UTIL_VERSION = 1.101
+PERL_PARAMS_UTIL_VERSION = 1.102
 PERL_PARAMS_UTIL_SOURCE = Params-Util-$(PERL_PARAMS_UTIL_VERSION).tar.gz
 PERL_PARAMS_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
 PERL_PARAMS_UTIL_LICENSE = Artistic or GPL-1.0+
-- 
2.27.0
