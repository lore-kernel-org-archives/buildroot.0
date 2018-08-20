From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:55:14 -0700
Subject: [Buildroot] [PATCH 13/18] perl-time-parsedate: add license
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180820115519.24046-14-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Copyright (C) 1996-2010 David Muir Sharnoff. Copyright (C) 2011 Google, Inc.
License hereby granted for anyone to use, modify or redistribute this module
at their own risk. Please feed useful changes back to cpan at dave.sharnoff.org.

https://fedoraproject.org/wiki/Licensing/TPDL
Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/perl-time-parsedate/perl-time-parsedate.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/perl-time-parsedate/perl-time-parsedate.mk b/package/perl-time-parsedate/perl-time-parsedate.mk
index e866e0decc..85b8c0ae81 100644
--- a/package/perl-time-parsedate/perl-time-parsedate.mk
+++ b/package/perl-time-parsedate/perl-time-parsedate.mk
@@ -8,6 +8,7 @@ PERL_TIME_PARSEDATE_VERSION = 2015.103
 PERL_TIME_PARSEDATE_SOURCE = Time-ParseDate-$(PERL_TIME_PARSEDATE_VERSION).tar.gz
 PERL_TIME_PARSEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MU/MUIR/modules
 PERL_TIME_PARSEDATE_LICENSE_FILES = README
-PERL_TIME_PARSEDATE_LICENSE = unknown
+# https://fedoraproject.org/wiki/Licensing/TPDL
+PERL_TIME_PARSEDATE_LICENSE = Public Domain
 
 $(eval $(perl-package))
-- 
2.14.4
