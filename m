From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:36:23 +0100
Subject: [Buildroot] [git commit] perl-net-http: bump to version 6.17
Message-ID: <20180117213712.0CECD81D68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0474b9da703608be9e7062bcd822a891f6b63d74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-net-http/perl-net-http.hash | 4 ++--
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 31cf85a..ff59a0d 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7d4f31e5b346e1926c0b9b4b27b07500 Net-HTTP-6.16.tar.gz
-sha256 70c45b6aaf3e9fb1ce30a1fc3cf828cfaee45c5c0bd147b2f617efade1765e78 Net-HTTP-6.16.tar.gz
+md5    068fa02fd3c8a5b63316025b5a24844c Net-HTTP-6.17.tar.gz
+sha256 1e8624b1618dc6f7f605f5545643ebb9b833930f4d7485d4124aa2f2f26d1611 Net-HTTP-6.17.tar.gz
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index 0278537..f13614e 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.16
+PERL_NET_HTTP_VERSION = 6.17
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_DEPENDENCIES = perl-uri
