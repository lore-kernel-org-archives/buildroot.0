From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 11 Mar 2020 08:09:48 +0100
Subject: [Buildroot] [PATCH 02/10] package/perl-dbi: bump to version 1.643
In-Reply-To: <20200311070956.6346-1-francois.perrad@gadz.org>
References: <20200311070956.6346-1-francois.perrad@gadz.org>
Message-ID: <20200311070956.6346-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-dbi/perl-dbi.hash | 4 ++--
 package/perl-dbi/perl-dbi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-dbi/perl-dbi.hash b/package/perl-dbi/perl-dbi.hash
index 100d07038..707accf01 100644
--- a/package/perl-dbi/perl-dbi.hash
+++ b/package/perl-dbi/perl-dbi.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    f2ba18b5cea1c8cb322a62be0a847f3d DBI-1.642.tar.gz
-sha256 3f2025023a56286cebd15cb495e36ccd9b456c3cc229bf2ce1f69e9ebfc27f5d DBI-1.642.tar.gz
+md5    352f80b1e23769c116082a90905d7398 DBI-1.643.tar.gz
+sha256 8a2b993db560a2c373c174ee976a51027dd780ec766ae17620c20393d2e836fa DBI-1.643.tar.gz
 
 # computed by scancpan
 sha256 33453c8b0d8d474a42669ac702a13c20f39c91a34b3df4e6ca778fc2f0f711c7 LICENSE
diff --git a/package/perl-dbi/perl-dbi.mk b/package/perl-dbi/perl-dbi.mk
index 3b824d748..482d3d176 100644
--- a/package/perl-dbi/perl-dbi.mk
+++ b/package/perl-dbi/perl-dbi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DBI_VERSION = 1.642
+PERL_DBI_VERSION = 1.643
 PERL_DBI_SOURCE = DBI-$(PERL_DBI_VERSION).tar.gz
 PERL_DBI_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMB
 PERL_DBI_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
