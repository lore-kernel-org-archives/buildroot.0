From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Oct 2015 21:56:02 +0100
Subject: [Buildroot] [git commit] perl-io-socket-ssl: bump to version 2.020
Message-ID: <20151025210816.39605818C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6d233bc8572e3febe4293975a56f048fe6555cc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash |    4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   |    2 +-
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
