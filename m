From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 26 Oct 2014 09:12:51 +0100
Subject: [Buildroot] [PATCH 3/6] perl-json-tiny: bump to version 0.50
In-Reply-To: <1414311174-28291-1-git-send-email-francois.perrad@gadz.org>
References: <1414311174-28291-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1414311174-28291-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-json-tiny/perl-json-tiny.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-json-tiny/perl-json-tiny.mk b/package/perl-json-tiny/perl-json-tiny.mk
index 3adcb49..7ee611d 100644
--- a/package/perl-json-tiny/perl-json-tiny.mk
+++ b/package/perl-json-tiny/perl-json-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_JSON_TINY_VERSION = 0.49
+PERL_JSON_TINY_VERSION = 0.50
 PERL_JSON_TINY_SOURCE = JSON-Tiny-$(PERL_JSON_TINY_VERSION).tar.gz
 PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO
 PERL_JSON_TINY_DEPENDENCIES = perl
-- 
1.9.1
