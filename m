From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 26 Oct 2014 09:12:50 +0100
Subject: [Buildroot] [PATCH 2/6] perl-path-tiny: bump to version 0.059
In-Reply-To: <1414311174-28291-1-git-send-email-francois.perrad@gadz.org>
References: <1414311174-28291-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1414311174-28291-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-path-tiny/perl-path-tiny.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index d8ed899..4f34b8a 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_PATH_TINY_VERSION = 0.055
+PERL_PATH_TINY_VERSION = 0.059
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
 PERL_PATH_TINY_DEPENDENCIES = perl
-- 
1.9.1
