From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:26:39 +0200
Subject: [Buildroot] [git commit] package/perl-io-html: bump to version 1.004
Message-ID: <20201024201639.A762482DA2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=338d050fab1d20a8396d04274b5400f8c39b91f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE diff:
-This software is copyright (c) 2014 by Christopher J. Madsen.
+This software is copyright (c) 2020 by Christopher J. Madsen.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-io-html/perl-io-html.hash | 6 +++---
 package/perl-io-html/perl-io-html.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-io-html/perl-io-html.hash b/package/perl-io-html/perl-io-html.hash
index d8d865e8da..4067d2faa1 100644
--- a/package/perl-io-html/perl-io-html.hash
+++ b/package/perl-io-html/perl-io-html.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    3f8958718844dc96b9f6946f21d70d22 IO-HTML-1.001.tar.gz
-sha256 ea78d2d743794adc028bc9589538eb867174b4e165d7d8b5f63486e6b828e7e0 IO-HTML-1.001.tar.gz
+md5  04bbe363686fd19bfb4cc0ed775e3d03  IO-HTML-1.004.tar.gz
+sha256  c87b2df59463bbf2c39596773dfb5c03bde0f7e1051af339f963f58c1cbd8bf5  IO-HTML-1.004.tar.gz
 
 # computed by scancpan
-sha256 b386f0545c17589141d98810dd46aa1c4a14d7028cae6bdd807969639ea7405e LICENSE
+sha256  669fdd41b60ef6169a975b87a5fe35c50e81b9efc8f96b2459f4fbb238079d84  LICENSE
diff --git a/package/perl-io-html/perl-io-html.mk b/package/perl-io-html/perl-io-html.mk
index ae8c6405a3..934ac60cb6 100644
--- a/package/perl-io-html/perl-io-html.mk
+++ b/package/perl-io-html/perl-io-html.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_HTML_VERSION = 1.001
+PERL_IO_HTML_VERSION = 1.004
 PERL_IO_HTML_SOURCE = IO-HTML-$(PERL_IO_HTML_VERSION).tar.gz
 PERL_IO_HTML_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CJ/CJM
 PERL_IO_HTML_LICENSE = Artistic or GPL-1.0+
