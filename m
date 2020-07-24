From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Jul 2020 18:21:25 +0200
Subject: [Buildroot] [PATCH 07/10] package/perl-lwp-protocol-https: bump to
 version 6.09
In-Reply-To: <20200724162128.2752535-1-francois.perrad@gadz.org>
References: <20200724162128.2752535-1-francois.perrad@gadz.org>
Message-ID: <20200724162128.2752535-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

now, LICENSE has its own file

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-lwp-protocol-https/perl-lwp-protocol-https.hash    | 6 +++---
 package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
index 899cc2207..680e24f60 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b8943dfb7d187af63c36fc18ab15947d LWP-Protocol-https-6.07.tar.gz
-sha256 522cc946cf84a1776304a5737a54b8822ec9e79b264d0ba0722a70473dbfb9e7 LWP-Protocol-https-6.07.tar.gz
+md5  6d497ec74f3cf88ad41898fcb8b01145  LWP-Protocol-https-6.09.tar.gz
+sha256  16cfe1a511690b066db5667c8714802ee2b9c5d28a31a3e7bd36fbc70a3af592  LWP-Protocol-https-6.09.tar.gz
 
 # computed by scancpan
-sha256 a93c39b0bce2bdff027b58d8a97f5116183b18b23da366fd7e1ec361d4603db2 README
+sha256  294e73f9bd40ea600e9478cd57489a7da72558a83c6a66f37a82e4e0d5a706d9  LICENSE
diff --git a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
index 00b93c74a..0c36e7aea 100644
--- a/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
+++ b/package/perl-lwp-protocol-https/perl-lwp-protocol-https.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.07
+PERL_LWP_PROTOCOL_HTTPS_VERSION = 6.09
 PERL_LWP_PROTOCOL_HTTPS_SOURCE = LWP-Protocol-https-$(PERL_LWP_PROTOCOL_HTTPS_VERSION).tar.gz
 PERL_LWP_PROTOCOL_HTTPS_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LWP_PROTOCOL_HTTPS_LICENSE = Artistic or GPL-1.0+
-PERL_LWP_PROTOCOL_HTTPS_LICENSE_FILES = README
+PERL_LWP_PROTOCOL_HTTPS_LICENSE_FILES = LICENSE
 PERL_LWP_PROTOCOL_HTTPS_DISTNAME = LWP-Protocol-https
 
 $(eval $(perl-package))
-- 
2.25.1
