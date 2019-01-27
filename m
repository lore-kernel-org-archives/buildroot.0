From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 11:22:40 +0100
Subject: [Buildroot] [git commit] perl-mojolicious: bump to version 8.11
Message-ID: <20190127102332.69E1B8E255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a9bc11ea96395e69cc3830748374ba1c7d8575b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index b406f6d82a..e2eb158b11 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    f1d22e9110f1b51f4be9a40a84391089 Mojolicious-8.04.tar.gz
-sha256 330e919f3caf62e03fdc545dda2e66f772f30192aed6c47e19fd78f67de557fb Mojolicious-8.04.tar.gz
+md5    00419dac75fec23d06fe8695e4bde303 Mojolicious-8.11.tar.gz
+sha256 d95f42aa901b9aba96880dae53fd77d89690cca65635ff93a47885a2c7b312f2 Mojolicious-8.11.tar.gz
 
 # computed by scancpan
 sha256 19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 8ea0c2e01b..4ff942ce80 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 8.04
+PERL_MOJOLICIOUS_VERSION = 8.11
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
