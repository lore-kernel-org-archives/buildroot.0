From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  3 Dec 2012 17:12:11 +0100
Subject: [Buildroot] [PATCH 1/4] perl: bump to version 5.16.2
Message-ID: <1354551135-30056-1-git-send-email-francois.perrad@gadz.org>
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
index 391047d..a86ee2a 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 PERL_VERSION_MAJOR = 16
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic
-- 
1.7.9.5
