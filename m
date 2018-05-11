From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 11 May 2018 13:58:05 +0200
Subject: [Buildroot] [PATCH/next 2/6] package/perl-net-http: bump version to
 6.18
In-Reply-To: <20180511115809.1647-1-bernd.kuhls@t-online.de>
References: <20180511115809.1647-1-bernd.kuhls@t-online.de>
Message-ID: <20180511115809.1647-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-net-http/perl-net-http.hash | 6 ++++--
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index ff59a0d9d3..21cd6308f2 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,3 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    068fa02fd3c8a5b63316025b5a24844c Net-HTTP-6.17.tar.gz
-sha256 1e8624b1618dc6f7f605f5545643ebb9b833930f4d7485d4124aa2f2f26d1611 Net-HTTP-6.17.tar.gz
+md5    6da11a7db0e933b7684148e1fb32006a Net-HTTP-6.18.tar.gz
+sha256 7e42df2db7adce3e0eb4f78b88c450f453f5380f120fd5411232e03374ba951c Net-HTTP-6.18.tar.gz
+# Locally computed
+sha256 49fbcc80e17295888b909176a0029f275a8c17b6cbfaf8867fe571ebe9a9ca79  LICENSE
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index f13614e346..12bd50f848 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.17
+PERL_NET_HTTP_VERSION = 6.18
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_DEPENDENCIES = perl-uri
-- 
2.14.2
