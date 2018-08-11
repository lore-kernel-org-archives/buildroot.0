From: Christopher McCrory <chrismcc@gmail.com>
Date: Sat, 11 Aug 2018 11:27:35 -0700
Subject: [Buildroot] [PATCH 03/17] perl-html-tagset: add host
In-Reply-To: <20180811182749.20924-1-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
Message-ID: <20180811182749.20924-4-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/perl-html-tagset/perl-html-tagset.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-html-tagset/perl-html-tagset.mk b/package/perl-html-tagset/perl-html-tagset.mk
index ff371fa2d3..d810fd5edb 100644
--- a/package/perl-html-tagset/perl-html-tagset.mk
+++ b/package/perl-html-tagset/perl-html-tagset.mk
@@ -11,3 +11,4 @@ PERL_HTML_TAGSET_LICENSE = Artistic or GPL-1.0+
 PERL_HTML_TAGSET_LICENSE_FILES = README
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
2.14.4
