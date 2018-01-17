From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:36:34 +0100
Subject: [Buildroot] [git commit] perl-io-socket-ssl: bump to version 2.052
Message-ID: <20180117213712.7579183F1C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97a3aec2fc469208a8335828cf2b41966771e090
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash | 4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index 617a973..3bf0421 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    98184d4ce23b2c5faf2e89120a683a07 IO-Socket-SSL-2.050.tar.gz
-sha256 54e6716e40df8b1c168d8f54a0b8f215313739bd99dda17adb7c00fe94656692 IO-Socket-SSL-2.050.tar.gz
+md5    26c9bcdfb4ba8763ef89264f21326a48 IO-Socket-SSL-2.052.tar.gz
+sha256 e4897a9b17cb18a3c44aa683980d52cef534cdfcb8063d6877c879bfa2f26673 IO-Socket-SSL-2.052.tar.gz
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index a1ba993..62fc229 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.050
+PERL_IO_SOCKET_SSL_VERSION = 2.052
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_DEPENDENCIES = perl-net-ssleay
