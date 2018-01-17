From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:36:29 +0100
Subject: [Buildroot] [git commit] perl-json-tiny: bump to version 0.58
Message-ID: <20180117213712.4714381D68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90cac11c471b0fab6d1717bd373fa4546780a495
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-json-tiny/perl-json-tiny.hash | 4 ++--
 package/perl-json-tiny/perl-json-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-json-tiny/perl-json-tiny.hash b/package/perl-json-tiny/perl-json-tiny.hash
index 4b6bb89..86478da 100644
--- a/package/perl-json-tiny/perl-json-tiny.hash
+++ b/package/perl-json-tiny/perl-json-tiny.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    52a57f8bd5b7727bc0ee8c4591431045 JSON-Tiny-0.56.tar.gz
-sha256 f5e3eecd278ddc0b15e3b3d8d108f89fa47cc039852bdb80b909b6bc1b538d04 JSON-Tiny-0.56.tar.gz
+md5    aa006882222e17a94295b3a655aab91b JSON-Tiny-0.58.tar.gz
+sha256 ad42e9137f5148df7fdb22aa52186b306032977bcd70d49f44a288070e4f0f23 JSON-Tiny-0.58.tar.gz
diff --git a/package/perl-json-tiny/perl-json-tiny.mk b/package/perl-json-tiny/perl-json-tiny.mk
index 3892da6..6b45613 100644
--- a/package/perl-json-tiny/perl-json-tiny.mk
+++ b/package/perl-json-tiny/perl-json-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_JSON_TINY_VERSION = 0.56
+PERL_JSON_TINY_VERSION = 0.58
 PERL_JSON_TINY_SOURCE = JSON-Tiny-$(PERL_JSON_TINY_VERSION).tar.gz
 PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO
 PERL_JSON_TINY_LICENSE = Artistic-2.0
