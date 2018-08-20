From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:55:02 -0700
Subject: [Buildroot] [PATCH 01/18] perl-dbi: add host package
In-Reply-To: <20180820115519.24046-1-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
Message-ID: <20180820115519.24046-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/perl-dbi/perl-dbi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl-dbi/perl-dbi.mk b/package/perl-dbi/perl-dbi.mk
index f7ae6ca5a1..4ee9149f1f 100644
--- a/package/perl-dbi/perl-dbi.mk
+++ b/package/perl-dbi/perl-dbi.mk
@@ -11,3 +11,4 @@ PERL_DBI_LICENSE = Artistic or GPL-1.0+
 PERL_DBI_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
2.14.4
