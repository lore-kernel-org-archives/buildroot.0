From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:43:34 +0100
Subject: [Buildroot] [git commit branch/next] perl-json-tiny: bump to
	version 0.53
Message-ID: <20150219214342.6291B817B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fd6ab65a3a6f439bf7d6a1af9b93c13eb9ea39e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-json-tiny/perl-json-tiny.hash |    3 +++
 package/perl-json-tiny/perl-json-tiny.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/perl-json-tiny/perl-json-tiny.hash b/package/perl-json-tiny/perl-json-tiny.hash
new file mode 100644
index 0000000..0a1e7ca
--- /dev/null
+++ b/package/perl-json-tiny/perl-json-tiny.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    70957d3df2ea67f8e2c760166fce7b24 JSON-Tiny-0.53.tar.gz
+sha256 37e547c5b5b7f4dd9adf00db7c77454f3451f79c1be93ef11d4f2ddc9c10aad9 JSON-Tiny-0.53.tar.gz
diff --git a/package/perl-json-tiny/perl-json-tiny.mk b/package/perl-json-tiny/perl-json-tiny.mk
index 7ee611d..ddc50ac 100644
--- a/package/perl-json-tiny/perl-json-tiny.mk
+++ b/package/perl-json-tiny/perl-json-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_JSON_TINY_VERSION = 0.50
+PERL_JSON_TINY_VERSION = 0.53
 PERL_JSON_TINY_SOURCE = JSON-Tiny-$(PERL_JSON_TINY_VERSION).tar.gz
 PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO
 PERL_JSON_TINY_DEPENDENCIES = perl
