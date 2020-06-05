From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Jun 2020 22:37:21 +0200
Subject: [Buildroot] [git commit] package/perl-mozilla-ca: bump to version
 20200520
Message-ID: <20200605203650.C97D880E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee7a4f84c2ddb7ecd9e998873ee837c90e1fcf22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 6 +++---
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index 0d52d192e6..c577d4887e 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.hash
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    9c93333e1d9d3fad639e9d4082898de1 Mozilla-CA-20180117.tar.gz
-sha256 f2cc9fbe119f756313f321e0d9f1fac0859f8f154ac9d75b1a264c1afdf4e406 Mozilla-CA-20180117.tar.gz
+md5  8ac3fe1a83c45da3f468f78ab8133ea6  Mozilla-CA-20200520.tar.gz
+sha256  b3ca0002310bf24a16c0d5920bdea97a2f46e77e7be3e7377e850d033387c726  Mozilla-CA-20200520.tar.gz
 
 # computed by scancpan
-sha256 95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e README
+sha256  95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e  README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
index 9fca66d000..3bcb947f72 100644
--- a/package/perl-mozilla-ca/perl-mozilla-ca.mk
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOZILLA_CA_VERSION = 20180117
+PERL_MOZILLA_CA_VERSION = 20200520
 PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
 PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AB/ABH
 PERL_MOZILLA_CA_LICENSE = MPL-2.0
