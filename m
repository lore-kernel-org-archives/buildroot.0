From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Apr 2021 22:46:47 +0200
Subject: [Buildroot] [git commit]
 package/perl-mojolicious-plugin-authentication: bump to version 1.36
Message-ID: <20210424202052.142CB85F4B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7545da304d7b024b15745ad4e30f662db28f350b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-This software is copyright (c) 2018 by Ben van Staveren.
+This software is copyright (c) 2021 by Ben van Staveren.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../perl-mojolicious-plugin-authentication.hash                     | 6 +++---
 .../perl-mojolicious-plugin-authentication.mk                       | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
index f225ff486b..dc14b7e682 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b318be1e1e50e7595baee639b2964565 Mojolicious-Plugin-Authentication-1.33.tar.gz
-sha256 1c32dffc88a683ba3b2719f34bc52fb9c5c5fb2f1276bbd30136bfad0ac262bc Mojolicious-Plugin-Authentication-1.33.tar.gz
+md5  7eda1fadc272de097aa8d58abb9197ad  Mojolicious-Plugin-Authentication-1.36.tar.gz
+sha256  8bc48363925261b253e3e10eacf60d71d9930de772936b7f3e5221691841f9bb  Mojolicious-Plugin-Authentication-1.36.tar.gz
 
 # computed by scancpan
-sha256 59727ac57166e9891175d8247a8ea47d4aeb24a0dc1e24011b773d139481b135 LICENSE
+sha256  37d219684a6c5f8754435fb0dd36a779121e416553fd6a75e22a7545039d1021  LICENSE
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
index cce12314db..63500864d9 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.33
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.36
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SOURCE = Mojolicious-Plugin-Authentication-$(PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JJ/JJATRIA
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE = Artistic or GPL-1.0+
