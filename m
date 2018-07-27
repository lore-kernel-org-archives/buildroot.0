From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Jul 2018 23:51:42 +0200
Subject: [Buildroot] [git commit] perl-mime-base64-urlsafe: add missing
 license declaration
Message-ID: <20180727214915.43F878A4EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fc04ce407818cb20c10151ccf8fb250c6696219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
index d72b36fb04..c29372ecd7 100644
--- a/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
+++ b/package/perl-mime-base64-urlsafe/perl-mime-base64-urlsafe.mk
@@ -7,6 +7,7 @@
 PERL_MIME_BASE64_URLSAFE_VERSION = 0.01
 PERL_MIME_BASE64_URLSAFE_SOURCE = MIME-Base64-URLSafe-$(PERL_MIME_BASE64_URLSAFE_VERSION).tar.gz
 PERL_MIME_BASE64_URLSAFE_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZUHO
+PERL_MIME_BASE64_URLSAFE_LICENSE = Artistic or GPL-1.0+
 PERL_MIME_BASE64_URLSAFE_LICENSE_FILES = README
 
 $(eval $(perl-package))
