From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 22:34:13 +0200
Subject: [Buildroot] [git commit] package/perl-exporter-tiny: bump to
 version 1.002002
Message-ID: <20200605203650.947C480E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e84e3d08f73ecfbe47dbc637c9e8d1d75d2ff8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE diff:
- This software is copyright (c) 2018 by Toby Inkster.
+ This software is copyright (c) 2020 by Toby Inkster.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-exporter-tiny/perl-exporter-tiny.hash | 8 ++++----
 package/perl-exporter-tiny/perl-exporter-tiny.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.hash b/package/perl-exporter-tiny/perl-exporter-tiny.hash
index 1d36c63a10..c714ef902e 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.hash
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.hash
@@ -1,7 +1,7 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    e33f25f7556f5f5264a92cb9870d0eac Exporter-Tiny-1.002001.tar.gz
-sha256 a82c334c02ce4b0f9ea77c67bf77738f76a9b8aa4bae5c7209d1c76453d3c48d Exporter-Tiny-1.002001.tar.gz
+md5  485897322a2514b4d6ca90b2daacb7cd  Exporter-Tiny-1.002002.tar.gz
+sha256  00f0b95716b18157132c6c118ded8ba31392563d19e490433e9a65382e707101  Exporter-Tiny-1.002002.tar.gz
 
 # computed by scancpan
-sha256 a109768ea1493cc7555d4381d6178d3cfc1fe52adc5d63d3831a2697d9fc90e6 COPYRIGHT
-sha256 c614dadb36b02257ab492e3d4341e52f3f03fe8147cafd2b7da03b3b5c0361e9 LICENSE
+sha256  f4cb223c8ac37d6ccd0e78b2892ca54a48a6adbe6a271c3c17c0226646297e66  COPYRIGHT
+sha256  1fb7395e76eabf94c421912d7d0a4f7fa745d49e1acb76b222c21d605b66bd25  LICENSE
diff --git a/package/perl-exporter-tiny/perl-exporter-tiny.mk b/package/perl-exporter-tiny/perl-exporter-tiny.mk
index 1ba1a5ac70..c7abfbae2d 100644
--- a/package/perl-exporter-tiny/perl-exporter-tiny.mk
+++ b/package/perl-exporter-tiny/perl-exporter-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_EXPORTER_TINY_VERSION = 1.002001
+PERL_EXPORTER_TINY_VERSION = 1.002002
 PERL_EXPORTER_TINY_SOURCE = Exporter-Tiny-$(PERL_EXPORTER_TINY_VERSION).tar.gz
 PERL_EXPORTER_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOBYINK
 PERL_EXPORTER_TINY_LICENSE = Artistic or GPL-1.0+
