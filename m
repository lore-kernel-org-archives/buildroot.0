From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 23 Jan 2015 17:37:02 +0100
Subject: [Buildroot] [PATCH 2/5] perl-net-ssleay: bump to version 1.67
In-Reply-To: <1422031025-29533-1-git-send-email-francois.perrad@gadz.org>
References: <1422031025-29533-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1422031025-29533-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-ssleay/perl-net-ssleay.hash | 3 +++
 package/perl-net-ssleay/perl-net-ssleay.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
 create mode 100644 package/perl-net-ssleay/perl-net-ssleay.hash

diff --git a/package/perl-net-ssleay/perl-net-ssleay.hash b/package/perl-net-ssleay/perl-net-ssleay.hash
new file mode 100644
index 0000000..569f3e4
--- /dev/null
+++ b/package/perl-net-ssleay/perl-net-ssleay.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    1e15d2287ce13e377c26240190da2a86 Net-SSLeay-1.67.tar.gz
+sha256 1876466e7a6373649299df4a2d094060e1bda074450b107545caf3e352c37e4e Net-SSLeay-1.67.tar.gz
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index ed2efd6..b850a5e 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSLEAY_VERSION = 1.66
+PERL_NET_SSLEAY_VERSION = 1.67
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
 PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
-- 
2.1.0
