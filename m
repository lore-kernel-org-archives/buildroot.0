From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jun 2021 21:55:27 +0200
Subject: [Buildroot] [git commit] package/perl-convert-asn1: bump to version
 0.31
Message-ID: <20210614192528.3BA7E8D2DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ac3a5d2ec4cba1eb811412e7bce316c153ca9a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
- This software is copyright (c) 2014 by Graham Barr.
+ This software is copyright (c) 2021 by Graham Barr.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-convert-asn1/perl-convert-asn1.hash | 6 +++---
 package/perl-convert-asn1/perl-convert-asn1.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-convert-asn1/perl-convert-asn1.hash b/package/perl-convert-asn1/perl-convert-asn1.hash
index 4fd7d3eb61..eb7973c313 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.hash
+++ b/package/perl-convert-asn1/perl-convert-asn1.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    68723e96be0b258a9e20480276e8a62c Convert-ASN1-0.27.tar.gz
-sha256 74a4a78ae0c5e973100ac0a8f203a110f76fb047b79dae4fc1fd7d6814d3d58a Convert-ASN1-0.27.tar.gz
+md5  1e12b263a5042804bb1c59ddce899876  Convert-ASN1-0.31.tar.gz
+sha256  6fe4c1ba744c3a8212bf2c9b2703d93530acc153435cf2f93633540b439fbbeb  Convert-ASN1-0.31.tar.gz
 
 # computed by scancpan
-sha256 4ef46cc39d9e2b4c767503457a1f8fda5bcf9c0c164923e2a54a3863209cf237 LICENSE
+sha256  db9e46a932b02253c8bddc05a44a0c1c6979627190afb2251dd76462dd370d79  LICENSE
diff --git a/package/perl-convert-asn1/perl-convert-asn1.mk b/package/perl-convert-asn1/perl-convert-asn1.mk
index b6ba76a7e8..c39fe3412f 100644
--- a/package/perl-convert-asn1/perl-convert-asn1.mk
+++ b/package/perl-convert-asn1/perl-convert-asn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_CONVERT_ASN1_VERSION = 0.27
+PERL_CONVERT_ASN1_VERSION = 0.31
 PERL_CONVERT_ASN1_SOURCE = Convert-ASN1-$(PERL_CONVERT_ASN1_VERSION).tar.gz
-PERL_CONVERT_ASN1_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GB/GBARR
+PERL_CONVERT_ASN1_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TI/TIMLEGGE
 PERL_CONVERT_ASN1_LICENSE = Artistic or GPL-1.0+
 PERL_CONVERT_ASN1_LICENSE_FILES = LICENSE
 PERL_CONVERT_ASN1_DISTNAME = Convert-ASN1
