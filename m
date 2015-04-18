From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 18 Apr 2015 10:15:28 +0200
Subject: [Buildroot] [PATCH 4/5] perl-mojolicous: bump to version 6.08
In-Reply-To: <1429344929-2198-1-git-send-email-francois.perrad@gadz.org>
References: <1429344929-2198-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1429344929-2198-4-git-send-email-francois.perrad@gadz.org>
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
index a6d7703..2955ed6 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    797f28b188dec6e6a899b9b481ee8228 Mojolicious-5.72.tar.gz
-sha256 323218db02890a0b5e5d756f663ad32dbf312d05aa564b06d0a927e4a6a434d4 Mojolicious-5.72.tar.gz
+md5    ab8d44864173583a5eae4f507420112f Mojolicious-6.08.tar.gz
+sha256 338c0310eb55c2be42dfee1173c4e3ee5bcd86f6be6f8035d1955c579767adb3 Mojolicious-6.08.tar.gz
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index cb633d6..549805b 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 5.72
+PERL_MOJOLICIOUS_VERSION = 6.08
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_DEPENDENCIES = perl
-- 
2.1.0
