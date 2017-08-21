From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:40:56 +0200
Subject: [Buildroot] [git commit] perl-net-http: bump to version 6.16
Message-ID: <20170902130618.F34A281D34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aeb565bb291bb7346aab34b8968811ffaed59de2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-net-http/perl-net-http.hash | 4 ++--
 package/perl-net-http/perl-net-http.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-http/perl-net-http.hash b/package/perl-net-http/perl-net-http.hash
index 4dfad86..31cf85a 100644
--- a/package/perl-net-http/perl-net-http.hash
+++ b/package/perl-net-http/perl-net-http.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    988c72ce2890df56e41df6695d108e5d Net-HTTP-6.12.tar.gz
-sha256 8565aff76b3d09084642f3a83c654fb4ced8220e8e19d35c78b661519b4c1be6 Net-HTTP-6.12.tar.gz
+md5    7d4f31e5b346e1926c0b9b4b27b07500 Net-HTTP-6.16.tar.gz
+sha256 70c45b6aaf3e9fb1ce30a1fc3cf828cfaee45c5c0bd147b2f617efade1765e78 Net-HTTP-6.16.tar.gz
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index 8dfe278..0278537 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_HTTP_VERSION = 6.12
+PERL_NET_HTTP_VERSION = 6.16
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_DEPENDENCIES = perl-uri
