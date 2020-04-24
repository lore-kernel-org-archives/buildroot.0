From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Apr 2020 16:18:33 +0200
Subject: [Buildroot] [PATCH 2/8] package/perl-io-socket-ssl: bump to version
 2.068
In-Reply-To: <20200424141839.1594-1-francois.perrad@gadz.org>
References: <20200424141839.1594-1-francois.perrad@gadz.org>
Message-ID: <20200424141839.1594-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 6 +++---
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index d849060f7..2180b6be3 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    1d55e9f66ca442f4e0ae4d018e3067fc IO-Socket-SSL-2.067.tar.gz
-sha256 ef8842806d047cf56e2af64add4ed30b24547bcbb50e8df33cee0c54609af1c1 IO-Socket-SSL-2.067.tar.gz
+md5  4230c829c8875889848093b2b46a7284  IO-Socket-SSL-2.068.tar.gz
+sha256  4420fc0056f1827b4dd1245eacca0da56e2182b4ef6fc078f107dc43c3fb8ff9  IO-Socket-SSL-2.068.tar.gz
 
 # computed by scancpan
-sha256 090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032 README
+sha256  090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032  README
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 4ab1f1fbe..b6c0ceb37 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.067
+PERL_IO_SOCKET_SSL_VERSION = 2.068
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
