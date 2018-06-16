From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 16 Jun 2018 10:16:23 +0200
Subject: [Buildroot] [PATCH 03/34] perl-io-socket: bump to version 2.056
In-Reply-To: <20180616081654.34649-1-francois.perrad@gadz.org>
References: <20180616081654.34649-1-francois.perrad@gadz.org>
Message-ID: <20180616081654.34649-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 7 +++++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index 3bf0421ee..5b9cb9934 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    26c9bcdfb4ba8763ef89264f21326a48 IO-Socket-SSL-2.052.tar.gz
-sha256 e4897a9b17cb18a3c44aa683980d52cef534cdfcb8063d6877c879bfa2f26673 IO-Socket-SSL-2.052.tar.gz
+md5    7f575fd3844263a3401dc6e1fe3ad44c IO-Socket-SSL-2.056.tar.gz
+sha256 91451ecc28b243a78b438f0a42db24c4b60a86f088879b38e40bdbd697818259 IO-Socket-SSL-2.056.tar.gz
+
+# computed by scancpan
+sha256 090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032 README
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 62fc2298c..95bb852f5 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.052
+PERL_IO_SOCKET_SSL_VERSION = 2.056
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_DEPENDENCIES = perl-net-ssleay
-- 
2.17.1
