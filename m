From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Apr 2019 14:24:36 +0200
Subject: [Buildroot] [git commit] package/perl-mojolicious: bump to version
 8.15
Message-ID: <20190427121957.150E58156E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a42b16d4377ce8bfb493e5fc14650f4e2a532f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index e2eb158b11..da701dd8a4 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    00419dac75fec23d06fe8695e4bde303 Mojolicious-8.11.tar.gz
-sha256 d95f42aa901b9aba96880dae53fd77d89690cca65635ff93a47885a2c7b312f2 Mojolicious-8.11.tar.gz
+md5    62a7925ce28403230cd920963043349a Mojolicious-8.15.tar.gz
+sha256 c8502b23e4f213544861f2040a34dfea72e3d1093355c24c70f12d65d077ecdb Mojolicious-8.15.tar.gz
 
 # computed by scancpan
 sha256 19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 4ff942ce80..043525bd20 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 8.11
+PERL_MOJOLICIOUS_VERSION = 8.15
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
