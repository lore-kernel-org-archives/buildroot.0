From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 24 Apr 2020 16:18:38 +0200
Subject: [Buildroot] [PATCH 7/8] package/perl-net-ssh2: bump to version 0.71
In-Reply-To: <20200424141839.1594-1-francois.perrad@gadz.org>
References: <20200424141839.1594-1-francois.perrad@gadz.org>
Message-ID: <20200424141839.1594-7-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-ssh2/perl-net-ssh2.hash | 6 +++---
 package/perl-net-ssh2/perl-net-ssh2.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/perl-net-ssh2/perl-net-ssh2.hash b/package/perl-net-ssh2/perl-net-ssh2.hash
index 006f79477..d65b6f36b 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.hash
+++ b/package/perl-net-ssh2/perl-net-ssh2.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    ef8d282c410728aa452fb380a7d22b05 Net-SSH2-0.70.tar.gz
-sha256 47236af8f4a5e4cfa3036f7969d940247349b65b032478a0c72ba0b2e398b000 Net-SSH2-0.70.tar.gz
+md5  baa1b19fec9ca37ecfc12a22ba0c9122  Net-SSH2-0.71.tar.gz
+sha256  ee411ec263c900c441fd1c490e9d52fc56b0bb32e1ed98869229501b200f8fa2  Net-SSH2-0.71.tar.gz
 
 # computed by scancpan
-sha256 3e479d43f8316315caa30ba00b7a143175326a3be83fd4e03146c831afaa22bd README
+sha256  b9fe64368dd41bb5b9405b23f95ee0deb970427895ab0119eb3cd4d221764c1d  README.pod
diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index e75d01d9b..10657c39c 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PERL_NET_SSH2_VERSION = 0.70
+PERL_NET_SSH2_VERSION = 0.71
 PERL_NET_SSH2_SOURCE = Net-SSH2-$(PERL_NET_SSH2_VERSION).tar.gz
-PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
+PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RK/RKITOVER
 PERL_NET_SSH2_LICENSE = Artistic or GPL-1.0+
-PERL_NET_SSH2_LICENSE_FILES = README
+PERL_NET_SSH2_LICENSE_FILES = README.pod
 PERL_NET_SSH2_DEPENDENCIES = libssh2 zlib
 PERL_NET_SSH2_DISTNAME = Net-SSH2
 
-- 
2.20.1
