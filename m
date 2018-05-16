From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 16 May 2018 18:50:59 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/perl-http-message: bump
 version to 6.16
Message-ID: <20180516165059.4550-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-http-message/perl-http-message.hash | 6 ++++--
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index a34d0456b1..b58792b5af 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,3 +1,5 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e4c6e183860c42cbdff65dcd76c333b0 HTTP-Message-6.14.tar.gz
-sha256 71aab9f10eb4b8ec6e8e3a85fc5acb46ba04db1c93eb99613b184078c5cf2ac9 HTTP-Message-6.14.tar.gz
+md5    eddd79e2d2975a55bb6ea2e7707e3137 HTTP-Message-6.16.tar.gz
+sha256 46790ae127946d5cfea5a1e05c1b9f4a045a7c5094fe81f086bbf3341290ebd0 HTTP-Message-6.16.tar.gz
+# Locally computed
+sha256 66f0d1e8593d5512d7a8cd90549a976aaae97e4fa9b6097249b3682f14747a6b  LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 722d6be671..c35796e065 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.14
+PERL_HTTP_MESSAGE_VERSION = 6.16
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_DEPENDENCIES = perl-encode-locale perl-http-date perl-io-html perl-lwp-mediatypes perl-uri
-- 
2.14.2
