From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 11 Mar 2020 08:09:50 +0100
Subject: [Buildroot] [PATCH 04/10] package/perl-http-message: bump to
 version 6.22
In-Reply-To: <20200311070956.6346-1-francois.perrad@gadz.org>
References: <20200311070956.6346-1-francois.perrad@gadz.org>
Message-ID: <20200311070956.6346-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index 78fda135c..80e117cff 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9fd400da24e1784f85d32de1705fc795 HTTP-Message-6.18.tar.gz
-sha256 d060d170d388b694c58c14f4d13ed908a2807f0e581146cef45726641d809112 HTTP-Message-6.18.tar.gz
+md5    3cfb96e96c1881afa72639a8f4282e86 HTTP-Message-6.22.tar.gz
+sha256 970efd151b81c95831d2a5f9e117f8032b63a1768cd2cd3f092ad634c85175c3 HTTP-Message-6.22.tar.gz
 
 # computed by scancpan
 sha256 66f0d1e8593d5512d7a8cd90549a976aaae97e4fa9b6097249b3682f14747a6b LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index becae4d17..c80d88405 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.18
+PERL_HTTP_MESSAGE_VERSION = 6.22
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
-- 
2.20.1
