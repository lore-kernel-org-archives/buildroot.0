From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jun 2018 14:29:50 +0200
Subject: [Buildroot] [git commit] perl-net-ssleay: bump to version 1.85
Message-ID: <20180616122909.7C20B8849C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de85509592d21043cb1b16ad97224406c2c57d6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-ssleay/perl-net-ssleay.hash | 7 +++++--
 package/perl-net-ssleay/perl-net-ssleay.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
index daa2c186b3..517b3c4da3 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.hash
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -1,3 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    cfbe968487149626978f427cc9fb8c77 Net-SSLeay-1.84.tar.gz
-sha256 823ec3cbb428309d6a9e56f362a9300693ce3215b7fede109adb7be361fff177 Net-SSLeay-1.84.tar.gz
+md5    d602bdce4e0531c6efc276e3e429ca69 Net-SSLeay-1.85.tar.gz
+sha256 9d8188b9fb1cae3bd791979c20554925d5e94a138d00414f1a6814549927b0c8 Net-SSLeay-1.85.tar.gz
+
+# computed by scancpan
+sha256 b55065185a2172d9f2ea2dd87c18c206ea3dc45a64e5f3deb3eee34d839dc822 LICENSE
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 3814038ccd..2b3b10716d 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.84
+PERL_NET_SSLEAY_VERSION = 1.85
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
 PERL_NET_SSLEAY_DEPENDENCIES = openssl
