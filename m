From: Francois Perrad <fperrad@gmail.com>
Date: Fri,  5 Jun 2020 20:04:19 +0200
Subject: [Buildroot] [PATCH 06/10] package/perl-mozilla-ca: bump to version
 20200520
In-Reply-To: <20200605180423.1991841-1-francois.perrad@gadz.org>
References: <20200605180423.1991841-1-francois.perrad@gadz.org>
Message-ID: <20200605180423.1991841-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mozilla-ca/perl-mozilla-ca.hash | 6 +++---
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
index 0d52d192e..c577d4887 100644
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
index 9fca66d00..3bcb947f7 100644
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
-- 
2.25.1
