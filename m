From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Apr 2014 17:05:56 +0200
Subject: [Buildroot] [PATCH 2/2] perl-cross: bump to version 0.8.5
In-Reply-To: <1398006356-5425-1-git-send-email-francois.perrad@gadz.org>
References: <1398006356-5425-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1398006356-5425-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 51aeb14..7fdb1b0 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,9 +12,9 @@ PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.8.3
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
-PERL_CROSS_SITE    = http://download.berlios.de/perlcross
+PERL_CROSS_VERSION = 0.8.5
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
+PERL_CROSS_SITE    = http://raw.github.com/arsv/perl-cross/releases
 PERL_CROSS_SOURCE  = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
 PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
 PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
-- 
1.9.1
