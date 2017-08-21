From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:40:48 +0200
Subject: [Buildroot] [git commit branch/next] perl-http-message: bump to
	version 6.13
Message-ID: <20170821214002.0BE4A7FF0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3dd4c190ea3b532ad9a6077d5137299006a80568
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-http-message/Config.in              | 5 ++---
 package/perl-http-message/perl-http-message.hash | 4 ++--
 package/perl-http-message/perl-http-message.mk   | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/perl-http-message/Config.in b/package/perl-http-message/Config.in
index 9dda1ee..682a4b0 100644
--- a/package/perl-http-message/Config.in
+++ b/package/perl-http-message/Config.in
@@ -6,7 +6,6 @@ config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	select BR2_PACKAGE_PERL_LWP_MEDIATYPES
 	select BR2_PACKAGE_PERL_URI
 	help
-	  The HTTP-Message distribution contains classes useful for representing
-	  the messages passed in HTTP style communication.
+	  HTTP style message (base class)
 
-	  https://github.com/libwww-perl/http-message
+	  https://github.com/libwww-perl/HTTP-Message
diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index f57fec2..bb52dea 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    4ed7add10daea3ab30abfeab6d03872f HTTP-Message-6.11.tar.gz
-sha256 e7b368077ae6a188d99920411d8f52a8e5acfb39574d4f5c24f46fd22533d81b HTTP-Message-6.11.tar.gz
+md5    4c1b7c6ee114c1cff69379ec9651d9ac HTTP-Message-6.13.tar.gz
+sha256 f25f38428de851e5661e72f124476494852eb30812358b07f1c3a289f6f5eded HTTP-Message-6.13.tar.gz
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index a66353a..4143432 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.11
+PERL_HTTP_MESSAGE_VERSION = 6.13
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
-PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_DEPENDENCIES = perl-encode-locale perl-http-date perl-io-html perl-lwp-mediatypes perl-uri
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_MESSAGE_LICENSE_FILES = LICENSE
