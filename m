From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 19:44:47 +0200
Subject: [Buildroot] [PATCH 12/14] package/perl-net-ssh2: bump to version
 0.70
In-Reply-To: <20190331174449.1461-1-francois.perrad@gadz.org>
References: <20190331174449.1461-1-francois.perrad@gadz.org>
Message-ID: <20190331174449.1461-12-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-ssh2/perl-net-ssh2.hash | 6 +++---
 package/perl-net-ssh2/perl-net-ssh2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-ssh2/perl-net-ssh2.hash b/package/perl-net-ssh2/perl-net-ssh2.hash
index 7a84949a6..006f79477 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.hash
+++ b/package/perl-net-ssh2/perl-net-ssh2.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    94ed21d4557a6bbc3cb6bfd7c3479ef0 Net-SSH2-0.69.tar.gz
-sha256 2fc85e1434b8a6e77142d85e3cea5a081ca71da5d02c4212b9970d3a3924baa6 Net-SSH2-0.69.tar.gz
+md5    ef8d282c410728aa452fb380a7d22b05 Net-SSH2-0.70.tar.gz
+sha256 47236af8f4a5e4cfa3036f7969d940247349b65b032478a0c72ba0b2e398b000 Net-SSH2-0.70.tar.gz
 
 # computed by scancpan
-sha256 6db904d7c8127a33df4666961088c97586c24644a4980dc50d0676ef4c0509f7 README
+sha256 3e479d43f8316315caa30ba00b7a143175326a3be83fd4e03146c831afaa22bd README
diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index 7860c7f05..e75d01d9b 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_SSH2_VERSION = 0.69
+PERL_NET_SSH2_VERSION = 0.70
 PERL_NET_SSH2_SOURCE = Net-SSH2-$(PERL_NET_SSH2_VERSION).tar.gz
 PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
 PERL_NET_SSH2_LICENSE = Artistic or GPL-1.0+
-- 
2.17.1
