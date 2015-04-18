From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 18 Apr 2015 10:15:26 +0200
Subject: [Buildroot] [PATCH 2/5] perl-io-socket-ssl: bump to version 2.012
In-Reply-To: <1429344929-2198-1-git-send-email-francois.perrad@gadz.org>
References: <1429344929-2198-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1429344929-2198-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index 5578892..cc6ad46 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    69cad2edebf89c6c295fe8778a4f9906 IO-Socket-SSL-2.010.tar.gz
-sha256 68491ad58eb28645ca1272657e9c77c4c8ae4a11d35fb630ead4b6157079503c IO-Socket-SSL-2.010.tar.gz
+md5    e8d6584271b8c9421115eede83d42182 IO-Socket-SSL-2.012.tar.gz
+sha256 02bd7f17ceb492e396eca6627f50aaa2a3ddfcb5bfa3889ddf145383b0b179d9 IO-Socket-SSL-2.012.tar.gz
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 70f73e8..16ea056 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.010
+PERL_IO_SOCKET_SSL_VERSION = 2.012
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_DEPENDENCIES = perl perl-net-ssleay
-- 
2.1.0
