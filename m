From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Apr 2015 15:54:45 +0200
Subject: [Buildroot] [PATCH 3/6] package/perl-html-parser: Add host variant
In-Reply-To: <1429970088-593-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429970088-593-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429970088-593-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed to make Mail-SpamAssassin?s dependency check happy.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-html-parser/perl-html-parser.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index ecdd7fd..60944fd 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -12,3 +12,4 @@ PERL_HTML_PARSER_LICENSE = Artistic or GPLv1+
 PERL_HTML_PARSER_LICENSE_FILES = README
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
1.7.10.4
