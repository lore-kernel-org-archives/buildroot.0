From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Sep 2018 15:35:13 +0200
Subject: [Buildroot] [git commit] perl-dbi: add host package
Message-ID: <20180911133819.8F1F483DA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50fe1383285b73074230feabdb2d2ca8e6a25cb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
