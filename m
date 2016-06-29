From: Julien Floret <julien.floret@6wind.com>
Date: Wed, 29 Jun 2016 15:46:21 +0200
Subject: [Buildroot] [PATCH 14/24] perl-file-util: drop unused host variant
In-Reply-To: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467207991-4905-15-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/perl-file-util/perl-file-util.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
index 7026515e6649..fe83585f3614 100644
--- a/package/perl-file-util/perl-file-util.mk
+++ b/package/perl-file-util/perl-file-util.mk
@@ -10,7 +10,5 @@ PERL_FILE_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOMMY
 PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
 PERL_FILE_UTIL_LICENSE = Artistic or GPLv1+
 PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
-HOST_PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
 
 $(eval $(perl-package))
-$(eval $(host-perl-package))
-- 
2.1.0
