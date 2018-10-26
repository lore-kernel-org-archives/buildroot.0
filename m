From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 26 Oct 2018 05:26:50 +0200
Subject: [Buildroot] [PATCH 05/11] perl-io-socket-ssl: bump to version 2.060
In-Reply-To: <20181026032656.9039-1-francois.perrad@gadz.org>
References: <20181026032656.9039-1-francois.perrad@gadz.org>
Message-ID: <20181026032656.9039-5-francois.perrad@gadz.org>
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
index 5b9cb9934..ad9e5ae4b 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7f575fd3844263a3401dc6e1fe3ad44c IO-Socket-SSL-2.056.tar.gz
-sha256 91451ecc28b243a78b438f0a42db24c4b60a86f088879b38e40bdbd697818259 IO-Socket-SSL-2.056.tar.gz
+md5    97fa6cd64f15db60f810cd8ab02d57fc IO-Socket-SSL-2.060.tar.gz
+sha256 fb5b2877ac5b686a5d7b8dd71cf5464ffe75d10c32047b5570674870e46b1b8c IO-Socket-SSL-2.060.tar.gz
 
 # computed by scancpan
 sha256 090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032 README
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 2b3e675d2..e4857c70c 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.056
+PERL_IO_SOCKET_SSL_VERSION = 2.060
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
-- 
2.17.1
