From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  7 Jun 2021 19:56:01 +0200
Subject: [Buildroot] [PATCH 3/6] package/perl-io-socket-ssl: bump to version
 2.071
In-Reply-To: <20210607175604.2850795-1-francois.perrad@gadz.org>
References: <20210607175604.2850795-1-francois.perrad@gadz.org>
Message-ID: <20210607175604.2850795-3-francois.perrad@gadz.org>
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
index 076e145ac..4f2a6811b 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  3c8df96b5249c02025e2eb48596c213b  IO-Socket-SSL-2.070.tar.gz
-sha256  876fe09763e7a474519431aff248cb1f1abaf070d6bdc791f60bf9abe781cd3b  IO-Socket-SSL-2.070.tar.gz
+md5  3e33497ba43be5adce1f980437253172  IO-Socket-SSL-2.071.tar.gz
+sha256  40da40948ecc9c787ed39c95715872679eebfd54243721174993a2003e32ab0a  IO-Socket-SSL-2.071.tar.gz
 
 # computed by scancpan
 sha256  090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032  README
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 1751bef0e..45f768305 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.070
+PERL_IO_SOCKET_SSL_VERSION = 2.071
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
-- 
2.30.2
