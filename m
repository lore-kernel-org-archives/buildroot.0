From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 29 Oct 2019 05:33:09 +0100
Subject: [Buildroot] [PATCH 2/2] package/perl-try-tiny: regen with LICENCE
 found
In-Reply-To: <20191029043309.11543-1-francois.perrad@gadz.org>
References: <20191029043309.11543-1-francois.perrad@gadz.org>
Message-ID: <20191029043309.11543-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-try-tiny/perl-try-tiny.hash | 2 +-
 package/perl-try-tiny/perl-try-tiny.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl-try-tiny/perl-try-tiny.hash b/package/perl-try-tiny/perl-try-tiny.hash
index 65731bc14..ed4d8ac74 100644
--- a/package/perl-try-tiny/perl-try-tiny.hash
+++ b/package/perl-try-tiny/perl-try-tiny.hash
@@ -3,4 +3,4 @@ md5    eb362c3cb32c42f9f28de9ddb7f2ead6 Try-Tiny-0.30.tar.gz
 sha256 da5bd0d5c903519bbf10bb9ba0cb7bcac0563882bcfe4503aee3fb143eddef6b Try-Tiny-0.30.tar.gz
 
 # computed by scancpan
-sha256 6c7eb089021283de176a5c838217ae16453cf9f67899b27cdcd0827045f6f781 README
+sha256 f1864ede834871a1207fcd19838b6bd5e1ff0a8704f5cc523fc397126041ed0b LICENCE
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index bce96269d..f13e2ee59 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -8,7 +8,7 @@ PERL_TRY_TINY_VERSION = 0.30
 PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
 PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_TRY_TINY_LICENSE = MIT
-PERL_TRY_TINY_LICENSE_FILES = README
+PERL_TRY_TINY_LICENSE_FILES = LICENCE
 PERL_TRY_TINY_DISTNAME = Try-Tiny
 
 $(eval $(perl-package))
-- 
2.20.1
