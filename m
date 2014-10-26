From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 26 Oct 2014 09:12:52 +0100
Subject: [Buildroot] [PATCH 4/6] perl-io-socket-ssl: bump to version 2.002
In-Reply-To: <1414311174-28291-1-git-send-email-francois.perrad@gadz.org>
References: <1414311174-28291-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1414311174-28291-4-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 53bcfa1..ad18c80 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 1.997
+PERL_IO_SOCKET_SSL_VERSION = 2.002
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_DEPENDENCIES = perl perl-net-ssleay
-- 
1.9.1
