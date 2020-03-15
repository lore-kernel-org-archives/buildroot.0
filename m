From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 16:09:54 +0100
Subject: [Buildroot] [git commit] package/perl-io-socket-ssl: bump to
 version 2.067
Message-ID: <20200315150141.C31617F9A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faa0550b7be00393bd7ac93c1d8bf870994357bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index de9b28abed..d849060f71 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    ecf96ce2ff9e04a03a2d101c76ce1020 IO-Socket-SSL-2.066.tar.gz
-sha256 0d47064781a545304d5dcea5dfcee3acc2e95a32e1b4884d80505cde8ee6ebcd IO-Socket-SSL-2.066.tar.gz
+md5    1d55e9f66ca442f4e0ae4d018e3067fc IO-Socket-SSL-2.067.tar.gz
+sha256 ef8842806d047cf56e2af64add4ed30b24547bcbb50e8df33cee0c54609af1c1 IO-Socket-SSL-2.067.tar.gz
 
 # computed by scancpan
 sha256 090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032 README
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 59c3407594..4ab1f1fbe1 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.066
+PERL_IO_SOCKET_SSL_VERSION = 2.067
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
