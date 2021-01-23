From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:26:46 +0100
Subject: [Buildroot] [git commit] package/perl-lwp-protocol-https: bump to
 version 6.10
Message-ID: <20210123200716.1369080296@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d755f769d89f5de47504dc561a4dd79d9afc3efb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-lwp-protocol-https/Config.in                    | 2 +-
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash | 4 ++--
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-lwp-protocol-https/Config.in b/package/perl-lwp-protocol-https/Config.in
index c4a7b306b3..9793b6f5d0 100644
--- a/package/perl-lwp-protocol-https/Config.in
+++ b/package/perl-lwp-protocol-https/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_PERL_LWP_PROTOCOL_HTTPS
 	help
 	  Provide https support for LWP::UserAgent.
 
-	  https://metacpan.org/release/LWP-Protocol-https
+	  https://github.com/libwww-perl/LWP-Protocol-https
 
 comment "perl-lwp-protocol-https needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
index 680e24f60b..a3c011fe84 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  6d497ec74f3cf88ad41898fcb8b01145  LWP-Protocol-https-6.09.tar.gz
-sha256  16cfe1a511690b066db5667c8714802ee2b9c5d28a31a3e7bd36fbc70a3af592  LWP-Protocol-https-6.09.tar.gz
+md5  cf64e4bc57a9266ac4343cdf0808c5c8  LWP-Protocol-https-6.10.tar.gz
+sha256  cecfc31fe2d4fc854cac47fce13d3a502e8fdfe60c5bc1c09535743185f2a86c  LWP-Protocol-https-6.10.tar.gz
 
 # computed by scancpan
 sha256  294e73f9bd40ea600e9478cd57489a7da72558a83c6a66f37a82e4e0d5a706d9  LICENSE
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
index 0c36e7aea1..0663820b2e 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.09
+PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.10
 PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VERSION).tar.gz
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic or GPL-1.0+
