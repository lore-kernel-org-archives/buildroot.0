From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 19:44:37 +0200
Subject: [Buildroot] [PATCH 02/14] package/perl-data-uuid: bump to version
 1.224
In-Reply-To: <20190331174449.1461-1-francois.perrad@gadz.org>
References: <20190331174449.1461-1-francois.perrad@gadz.org>
Message-ID: <20190331174449.1461-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-data-uuid/perl-data-uuid.hash | 4 ++--
 package/perl-data-uuid/perl-data-uuid.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-data-uuid/perl-data-uuid.hash b/package/perl-data-uuid/perl-data-uuid.hash
index 5086936d4..280567177 100644
--- a/package/perl-data-uuid/perl-data-uuid.hash
+++ b/package/perl-data-uuid/perl-data-uuid.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    7619929e8fe205a7fb83bc1c29ecbf99 Data-UUID-1.221.tar.gz
-sha256 3cc7b2a3a7b74b45a059e013f7fd878078500ea4b7269036f84556b022078667 Data-UUID-1.221.tar.gz
+md5    71510bbcce760c394591fca83a9b5e6d Data-UUID-1.224.tar.gz
+sha256 c958c17502bbef5eccf40c040874895747f7f9b9f9e5192c18688370981bf47c Data-UUID-1.224.tar.gz
 
 # computed by scancpan
 sha256 0560c8eea8e1fb8173faa6c2e9b7e9f8728b8ae8250a814709a53c30b778d5fb LICENSE
diff --git a/package/perl-data-uuid/perl-data-uuid.mk b/package/perl-data-uuid/perl-data-uuid.mk
index 6ce393960..00dccdb7e 100644
--- a/package/perl-data-uuid/perl-data-uuid.mk
+++ b/package/perl-data-uuid/perl-data-uuid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_DATA_UUID_VERSION = 1.221
+PERL_DATA_UUID_VERSION = 1.224
 PERL_DATA_UUID_SOURCE = Data-UUID-$(PERL_DATA_UUID_VERSION).tar.gz
 PERL_DATA_UUID_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
 # The license is documented at
-- 
2.17.1
