From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Nov 2019 19:09:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/perl-gdtextutil: add license
Message-ID: <20191125180957.1024314-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dustismo.LICENSE states that license is GPL-2.0+

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/perl-gdtextutil/perl-gdtextutil.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-gdtextutil/perl-gdtextutil.mk b/package/perl-gdtextutil/perl-gdtextutil.mk
index cd1617fbbd..d40ad5fd1c 100644
--- a/package/perl-gdtextutil/perl-gdtextutil.mk
+++ b/package/perl-gdtextutil/perl-gdtextutil.mk
@@ -7,6 +7,7 @@
 PERL_GDTEXTUTIL_VERSION = 0.86
 PERL_GDTEXTUTIL_SOURCE = GDTextUtil-$(PERL_GDTEXTUTIL_VERSION).tar.gz
 PERL_GDTEXTUTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MV/MVERB
+PERL_GDTEXTUTIL_LICENSE = GPL-2.0+
 PERL_GDTEXTUTIL_LICENSE_FILES = Dustismo.LICENSE
 PERL_GDTEXTUTIL_DISTNAME = GDTextUtil
 
-- 
2.24.0
