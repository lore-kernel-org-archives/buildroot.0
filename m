From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Oct 2015 18:26:50 +0200
Subject: [Buildroot] [PATCH 03/11] perl-io-socket-ssl: bump to version 2.020
In-Reply-To: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
References: <1445704018-9780-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1445704018-9780-3-git-send-email-francois.perrad@gadz.org>
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
index 3a85814..e419c9f 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a71e9f0f76c7a15a11fef14ca8ef8aa8 IO-Socket-SSL-2.016.tar.gz
-sha256 936268b3c152a4900f9c1762ab2e0aa3f84ed3a988e8e60aaad604beda7bfe41 IO-Socket-SSL-2.016.tar.gz
+md5    dc0f5992492786a0bde79d2f8fb00cc1 IO-Socket-SSL-2.020.tar.gz
+sha256 5a8e2ce93aa410cd18507d55860efb8277184f52a20ca523e4c047d4bce512db IO-Socket-SSL-2.020.tar.gz
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index b0aa3df..fcf914c 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.016
+PERL_IO_SOCKET_SSL_VERSION = 2.020
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_DEPENDENCIES = perl-net-ssleay
-- 
2.5.0
