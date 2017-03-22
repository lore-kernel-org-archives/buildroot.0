From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 22 Mar 2017 23:18:55 +0530
Subject: [Buildroot] [PATCH 6/6] perl-encode-detect: use documented license
	abbreviation
In-Reply-To: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1490204935-13172-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1490204935-13172-6-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For MPL version 1.1, we use MPLv1.1 as license abbreviation.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/perl-encode-detect/perl-encode-detect.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-encode-detect/perl-encode-detect.mk b/package/perl-encode-detect/perl-encode-detect.mk
index 732fba8..692bd6b 100644
--- a/package/perl-encode-detect/perl-encode-detect.mk
+++ b/package/perl-encode-detect/perl-encode-detect.mk
@@ -8,7 +8,7 @@ PERL_ENCODE_DETECT_VERSION = 1.01
 PERL_ENCODE_DETECT_SOURCE = Encode-Detect-$(PERL_ENCODE_DETECT_VERSION).tar.gz
 PERL_ENCODE_DETECT_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JG/JGMYERS
 PERL_ENCODE_DETECT_DEPENDENCIES = host-perl-module-build
-PERL_ENCODE_DETECT_LICENSE = MPL-1.1
+PERL_ENCODE_DETECT_LICENSE = MPLv1.1
 PERL_ENCODE_DETECT_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
-- 
2.6.2
