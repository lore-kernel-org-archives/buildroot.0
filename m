From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jun 2018 14:29:45 +0200
Subject: [Buildroot] [git commit] perl-http-message: bump to version 6.18
Message-ID: <20180616122909.644238849C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b31677677bcdecff741fa93c1ab6b67395541550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-http-message/perl-http-message.hash | 9 +++++----
 package/perl-http-message/perl-http-message.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/perl-http-message/perl-http-message.hash b/package/perl-http-message/perl-http-message.hash
index b58792b5af..78fda135cc 100644
--- a/package/perl-http-message/perl-http-message.hash
+++ b/package/perl-http-message/perl-http-message.hash
@@ -1,5 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    eddd79e2d2975a55bb6ea2e7707e3137 HTTP-Message-6.16.tar.gz
-sha256 46790ae127946d5cfea5a1e05c1b9f4a045a7c5094fe81f086bbf3341290ebd0 HTTP-Message-6.16.tar.gz
-# Locally computed
-sha256 66f0d1e8593d5512d7a8cd90549a976aaae97e4fa9b6097249b3682f14747a6b  LICENSE
+md5    9fd400da24e1784f85d32de1705fc795 HTTP-Message-6.18.tar.gz
+sha256 d060d170d388b694c58c14f4d13ed908a2807f0e581146cef45726641d809112 HTTP-Message-6.18.tar.gz
+
+# computed by scancpan
+sha256 66f0d1e8593d5512d7a8cd90549a976aaae97e4fa9b6097249b3682f14747a6b LICENSE
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index c35796e065..e4d642afde 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_HTTP_MESSAGE_VERSION = 6.16
+PERL_HTTP_MESSAGE_VERSION = 6.18
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_HTTP_MESSAGE_DEPENDENCIES = perl-encode-locale perl-http-date perl-io-html perl-lwp-mediatypes perl-uri
