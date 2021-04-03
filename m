From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Apr 2021 09:50:43 +0200
Subject: [Buildroot] [PATCH 2/6] package/perl-uri: bump version to 5.09
In-Reply-To: <20210403075047.598935-1-bernd.kuhls@t-online.de>
References: <20210403075047.598935-1-bernd.kuhls@t-online.de>
Message-ID: <20210403075047.598935-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index c6cb7971f0..578beed9bf 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  3dd176c522e9d39d88bcf1221fcd7ab2  URI-5.06.tar.gz
-sha256  68555c576763769be43340459b9db7e159378edcd7db6d7518e16efdabdeb0c1  URI-5.06.tar.gz
+md5  bd66b0c620d076c4b0de9507b5f1fbdf  URI-5.09.tar.gz
+sha256  03e63ada499d2645c435a57551f041f3943970492baa3b3338246dab6f1fae0a  URI-5.09.tar.gz
 
 # computed by scancpan
 sha256  65cd6f88516a30f56fd4e0080fb78ea69424fc89067470dc994e4abfba08664e  LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 6eccb1b9bc..d588e82056 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 5.06
+PERL_URI_VERSION = 5.09
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic or GPL-1.0+
-- 
2.29.2
