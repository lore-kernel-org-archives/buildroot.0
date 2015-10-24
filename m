From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Oct 2015 18:26:52 +0200
Subject: [Buildroot] [PATCH 05/11] perl-mojolicious: bump to version 6.25
In-Reply-To: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
References: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1445704018-9780-5-git-send-email-francois.perrad@gadz.org>
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
index d8114e2..289f1f3 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    dd067c5791e27a104a07f2676edf1bf2 Mojolicious-6.14.tar.gz
-sha256 9808871b24ee8c9709fc1bd0473a64a54d99fc8c4d6334f503256ae90130b05a Mojolicious-6.14.tar.gz
+md5    8c189aed47bbe330584fb335251b3380 Mojolicious-6.25.tar.gz
+sha256 2e34d665a505ca9cbd4c55f010b17d184533b9ba2f92431d7c4126e0edc3a41a Mojolicious-6.25.tar.gz
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 302cedb..3ea828b 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 6.14
+PERL_MOJOLICIOUS_VERSION = 6.25
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.5.0
