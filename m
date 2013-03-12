From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 12 Mar 2013 11:00:03 +0100
Subject: [Buildroot] [PATCH] perl: bump to version 5.16.3
Message-ID: <1363082403-20862-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index da54ef1..66f7daa 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 PERL_VERSION_MAJOR = 16
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic
-- 
1.7.9.5
