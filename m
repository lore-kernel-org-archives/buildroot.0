From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Aug 2017 10:03:17 +0200
Subject: [Buildroot] [PATCH 04/18] perl-io-socket-ssl: bump to version 2.050
In-Reply-To: <20170820080331.12935-1-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
Message-ID: <20170820080331.12935-4-francois.perrad@gadz.org>
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
index 852eb8d72..617a97387 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    a5f284d543aec4a6fcd595eb5fc8898b IO-Socket-SSL-2.022.tar.gz
-sha256 651c4e5e2762ca780f2743986639b64557295bb326fddaff32f3adc0eac4f806 IO-Socket-SSL-2.022.tar.gz
+md5    98184d4ce23b2c5faf2e89120a683a07 IO-Socket-SSL-2.050.tar.gz
+sha256 54e6716e40df8b1c168d8f54a0b8f215313739bd99dda17adb7c00fe94656692 IO-Socket-SSL-2.050.tar.gz
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index be7db72fa..a1ba9939e 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.022
+PERL_IO_SOCKET_SSL_VERSION = 2.050
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_DEPENDENCIES = perl-net-ssleay
-- 
2.11.0
