From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:21:25 +0200
Subject: [Buildroot] [git commit] perl-mojolicious: bump to version 6.14
Message-ID: <20150726162155.A89FC81D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eeb210d8f31c5c9e368378010c1a829e931183da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-mojolicious/perl-mojolicious.hash |    4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index 2955ed6..d8114e2 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    ab8d44864173583a5eae4f507420112f Mojolicious-6.08.tar.gz
-sha256 338c0310eb55c2be42dfee1173c4e3ee5bcd86f6be6f8035d1955c579767adb3 Mojolicious-6.08.tar.gz
+md5    dd067c5791e27a104a07f2676edf1bf2 Mojolicious-6.14.tar.gz
+sha256 9808871b24ee8c9709fc1bd0473a64a54d99fc8c4d6334f503256ae90130b05a Mojolicious-6.14.tar.gz
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 549805b..50a7f98 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 6.08
+PERL_MOJOLICIOUS_VERSION = 6.14
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_DEPENDENCIES = perl
