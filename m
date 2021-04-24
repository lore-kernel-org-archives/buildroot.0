From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Apr 2021 21:20:26 +0200
Subject: [Buildroot] [PATCH 6/9] package/perl-moo: bump to version 2.005004
In-Reply-To: <20210424192029.595977-1-francois.perrad@gadz.org>
References: <20210424192029.595977-1-francois.perrad@gadz.org>
Message-ID: <20210424192029.595977-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff LICENSE:
-This software is Copyright (c) 2020 by mst - Matt S. Trout (cpan:MSTROUT) <mst@shadowcat.co.uk>.
+This software is Copyright (c) 2021 by mst - Matt S. Trout (cpan:MSTROUT) <mst@shadowcat.co.uk>.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-moo/perl-moo.hash | 6 +++---
 package/perl-moo/perl-moo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-moo/perl-moo.hash b/package/perl-moo/perl-moo.hash
index af0dd2e92..9b67e7a65 100644
--- a/package/perl-moo/perl-moo.hash
+++ b/package/perl-moo/perl-moo.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  51f3732e043a1e856ab6cdc260d2814c  Moo-2.004004.tar.gz
-sha256  714b77b115788708c6d8ab6f18eea173f8109d397aecd34e32cc71a0ffcf2246  Moo-2.004004.tar.gz
+md5  49ecf491b49b9b200e8a5dfd1a42b480  Moo-2.005004.tar.gz
+sha256  e3030b80bd554a66f6b3c27fd53b1b5909d12af05c4c11ece9a58f8d1e478928  Moo-2.005004.tar.gz
 
 # computed by scancpan
-sha256  0f2d6b537f7a735c981511875d832bc8ff767bf97d62848cf0bada964e40aadd  LICENSE
+sha256  a8a1595c2347f7d10e896809d4f3dea85ccc10ac5644b8073111233cd120b14a  LICENSE
diff --git a/package/perl-moo/perl-moo.mk b/package/perl-moo/perl-moo.mk
index 77c6c1e35..6c484ba9e 100644
--- a/package/perl-moo/perl-moo.mk
+++ b/package/perl-moo/perl-moo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOO_VERSION = 2.004004
+PERL_MOO_VERSION = 2.005004
 PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
 PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_MOO_LICENSE = Artistic or GPL-1.0+
-- 
2.27.0
