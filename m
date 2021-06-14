From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jun 2021 21:55:32 +0200
Subject: [Buildroot] [git commit] package/perl-io-socket-ssl: bump to
 version 2.071
Message-ID: <20210614192528.52DE98D57B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07ec544a17ad808bcdb86504bc7b7bd6ef55083d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index 076e145acd..4f2a6811bd 100644
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
index 1751bef0e4..45f7683058 100644
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
