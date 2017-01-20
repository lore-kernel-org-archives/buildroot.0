From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 20:27:55 +0100
Subject: [Buildroot] [git commit] perl-json-tiny: bump to version 0.56
Message-ID: <20170120194046.4371F81EC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9b783aab98375d1d077998d11366886719887325
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-json-tiny/perl-json-tiny.hash | 4 ++--
 package/perl-json-tiny/perl-json-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-json-tiny/perl-json-tiny.hash b/package/perl-json-tiny/perl-json-tiny.hash
index 0a1e7ca..4b6bb89 100644
--- a/package/perl-json-tiny/perl-json-tiny.hash
+++ b/package/perl-json-tiny/perl-json-tiny.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    70957d3df2ea67f8e2c760166fce7b24 JSON-Tiny-0.53.tar.gz
-sha256 37e547c5b5b7f4dd9adf00db7c77454f3451f79c1be93ef11d4f2ddc9c10aad9 JSON-Tiny-0.53.tar.gz
+md5    52a57f8bd5b7727bc0ee8c4591431045 JSON-Tiny-0.56.tar.gz
+sha256 f5e3eecd278ddc0b15e3b3d8d108f89fa47cc039852bdb80b909b6bc1b538d04 JSON-Tiny-0.56.tar.gz
diff --git a/package/perl-json-tiny/perl-json-tiny.mk b/package/perl-json-tiny/perl-json-tiny.mk
index 7a2a42e..3892da6 100644
--- a/package/perl-json-tiny/perl-json-tiny.mk
+++ b/package/perl-json-tiny/perl-json-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_JSON_TINY_VERSION = 0.53
+PERL_JSON_TINY_VERSION = 0.56
 PERL_JSON_TINY_SOURCE = JSON-Tiny-$(PERL_JSON_TINY_VERSION).tar.gz
 PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO
 PERL_JSON_TINY_LICENSE = Artistic-2.0
