From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 17 Jan 2018 18:45:08 +0100
Subject: [Buildroot] [PATCH 02/14] perl-uri: bump to version 1.73
In-Reply-To: <20180117174520.29545-1-francois.perrad@gadz.org>
References: <20180117174520.29545-1-francois.perrad@gadz.org>
Message-ID: <20180117174520.29545-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-uri/perl-uri.hash | 4 ++--
 package/perl-uri/perl-uri.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
index a11924fdb..5f27230e5 100644
--- a/package/perl-uri/perl-uri.hash
+++ b/package/perl-uri/perl-uri.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    cd56d81ed429efaa97e7f3ff08851b48 URI-1.72.tar.gz
-sha256 35f14431d4b300de4be1163b0b5332de2d7fbda4f05ff1ed198a8e9330d40a32 URI-1.72.tar.gz
+md5    37d44a08e599aa945b32a9434ffe00a5 URI-1.73.tar.gz
+sha256 cca7ab4a6f63f3ccaacae0f2e1337e8edf84137e73f18548ec7d659f23efe413 URI-1.73.tar.gz
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index 75f374a29..690a0eb8c 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_URI_VERSION = 1.72
+PERL_URI_VERSION = 1.73
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_URI_LICENSE = Artistic or GPL-1.0+
-- 
2.11.0
