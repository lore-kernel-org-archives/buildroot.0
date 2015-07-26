From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:21:03 +0200
Subject: [Buildroot] [git commit branch/next] perl-io-socket-ssl: bump to
	version 2.016
Message-ID: <20150808105641.CFE337FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=35bb40429d97c31b957483a546d3ebd64afdb299
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash |    4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index cc6ad46..3a85814 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e8d6584271b8c9421115eede83d42182 IO-Socket-SSL-2.012.tar.gz
-sha256 02bd7f17ceb492e396eca6627f50aaa2a3ddfcb5bfa3889ddf145383b0b179d9 IO-Socket-SSL-2.012.tar.gz
+md5    a71e9f0f76c7a15a11fef14ca8ef8aa8 IO-Socket-SSL-2.016.tar.gz
+sha256 936268b3c152a4900f9c1762ab2e0aa3f84ed3a988e8e60aaad604beda7bfe41 IO-Socket-SSL-2.016.tar.gz
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 16ea056..1816e93 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.012
+PERL_IO_SOCKET_SSL_VERSION = 2.016
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_DEPENDENCIES = perl perl-net-ssleay
