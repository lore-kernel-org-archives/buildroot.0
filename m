From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 26 Jan 2019 09:04:41 +0100
Subject: [Buildroot] [PATCH 8/8] perl-uri: bump to version 1.76
In-Reply-To: <20190126080441.10769-1-francois.perrad@gadz.org>
References: <20190126080441.10769-1-francois.perrad@gadz.org>
Message-ID: <20190126080441.10769-8-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index 4ef17ece6..02287a064 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    892f7183b178af40f205ba37128225db URI-1.74.tar.gz
-sha256 a9c254f45f89cb1dd946b689dfe433095404532a4543bdaab0b71ce0fdcdd53d URI-1.74.tar.gz
+md5    c236e0142adecc1b1104da664bc43a79 URI-1.76.tar.gz
+sha256 b2c98e1d50d6f572483ee538a6f4ccc8d9185f91f0073fd8af7390898254413e URI-1.76.tar.gz
 
 # computed by scancpan
 sha256 65cd6f88516a30f56fd4e0080fb78ea69424fc89067470dc994e4abfba08664e LICENSE
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 5be440131..730b39052 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 1.74
+PERL_URI_VERSION = 1.76
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
-PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_URI_LICENSE = Artistic or GPL-1.0+
 PERL_URI_LICENSE_FILES = LICENSE
 PERL_URI_DISTNAME = URI
-- 
2.17.1
