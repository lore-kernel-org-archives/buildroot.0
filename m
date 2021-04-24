From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Apr 2021 22:46:50 +0200
Subject: [Buildroot] [git commit] package/perl-net-ssh2: bump to version 0.72
Message-ID: <20210424202052.2DD1C83992@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd1d56bcde2a571062a1943c88506a8d9d2db357
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff README.pod:
-Copyright (C) 2011 - 2019 by Salvador FandiE<ntilde>o (salva at cpan.org).
+Copyright (C) 2011 - 2020 by Salvador FandiE<ntilde>o (salva at cpan.org).

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-net-ssh2/perl-net-ssh2.hash | 6 +++---
 package/perl-net-ssh2/perl-net-ssh2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/perl-net-ssh2/perl-net-ssh2.hash b/package/perl-net-ssh2/perl-net-ssh2.hash
index d65b6f36b8..b2e8b2d48e 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.hash
+++ b/package/perl-net-ssh2/perl-net-ssh2.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  baa1b19fec9ca37ecfc12a22ba0c9122  Net-SSH2-0.71.tar.gz
-sha256  ee411ec263c900c441fd1c490e9d52fc56b0bb32e1ed98869229501b200f8fa2  Net-SSH2-0.71.tar.gz
+md5  57aa0f6e2be4020f75888a7195ad5cba  Net-SSH2-0.72.tar.gz
+sha256  867d83070fac6436b9f0971918243002072fbf8d2724a87c254b34250dce0222  Net-SSH2-0.72.tar.gz
 
 # computed by scancpan
-sha256  b9fe64368dd41bb5b9405b23f95ee0deb970427895ab0119eb3cd4d221764c1d  README.pod
+sha256  268afaee7aa88a41959c93cd91853e8124bdbe64a74480d36ff1130e01a1c0ca  README.pod
diff --git a/package/perl-net-ssh2/perl-net-ssh2.mk b/package/perl-net-ssh2/perl-net-ssh2.mk
index 10657c39ca..5572e23257 100644
--- a/package/perl-net-ssh2/perl-net-ssh2.mk
+++ b/package/perl-net-ssh2/perl-net-ssh2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PERL_NET_SSH2_VERSION = 0.71
+PERL_NET_SSH2_VERSION = 0.72
 PERL_NET_SSH2_SOURCE = Net-SSH2-$(PERL_NET_SSH2_VERSION).tar.gz
-PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RK/RKITOVER
+PERL_NET_SSH2_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SA/SALVA
 PERL_NET_SSH2_LICENSE = Artistic or GPL-1.0+
 PERL_NET_SSH2_LICENSE_FILES = README.pod
 PERL_NET_SSH2_DEPENDENCIES = libssh2 zlib
