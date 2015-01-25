From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:23:06 +0100
Subject: [Buildroot] [git commit] perl-io-socket-ssl: bump to version 2.010
Message-ID: <20150125142313.6417D80142@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2252c5e01d2f44acabb8377cb096a10ac042c7d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash |    3 +++
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
new file mode 100644
index 0000000..5578892
--- /dev/null
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    69cad2edebf89c6c295fe8778a4f9906 IO-Socket-SSL-2.010.tar.gz
+sha256 68491ad58eb28645ca1272657e9c77c4c8ae4a11d35fb630ead4b6157079503c IO-Socket-SSL-2.010.tar.gz
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index ad18c80..70f73e8 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.002
+PERL_IO_SOCKET_SSL_VERSION = 2.010
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_DEPENDENCIES = perl perl-net-ssleay
