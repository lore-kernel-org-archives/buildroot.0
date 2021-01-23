From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:26:46 +0100
Subject: [Buildroot] [git commit] package/perl-role-tiny: bump to version
 2.002003
Message-ID: <20210123200716.5FBA080296@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94ddf8605fce72a6c9d11584fd913260e70b762f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

diff LICENSE:
-This software is Copyright (c) 2019 by mst - Matt S. Trout (cpan:MSTROUT) <mst@shadowcat.co.uk>.
+This software is Copyright (c) 2021 by mst - Matt S. Trout (cpan:MSTROUT) <mst@shadowcat.co.uk>.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-role-tiny/perl-role-tiny.hash | 6 +++---
 package/perl-role-tiny/perl-role-tiny.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-role-tiny/perl-role-tiny.hash b/package/perl-role-tiny/perl-role-tiny.hash
index c05873e653..9de786800a 100644
--- a/package/perl-role-tiny/perl-role-tiny.hash
+++ b/package/perl-role-tiny/perl-role-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    98446826608b1e943e65c1f6e35942fe Role-Tiny-2.001004.tar.gz
-sha256 92ba5712850a74102c93c942eb6e7f62f7a4f8f483734ed289d08b324c281687 Role-Tiny-2.001004.tar.gz
+md5  065e459cdc3c6e163c6e8359baf69f45  Role-Tiny-2.002003.tar.gz
+sha256  6981e5f2d0beded157840199d678da462b22a9a3753333cab322ab6efb0fbb89  Role-Tiny-2.002003.tar.gz
 
 # computed by scancpan
-sha256 88f4a8719c584d756dcfeebc7f35643066354188bfb57c672fbafcd44e044e9c LICENSE
+sha256  a8a1595c2347f7d10e896809d4f3dea85ccc10ac5644b8073111233cd120b14a  LICENSE
diff --git a/package/perl-role-tiny/perl-role-tiny.mk b/package/perl-role-tiny/perl-role-tiny.mk
index 0e1974fa1f..5a6477f94c 100644
--- a/package/perl-role-tiny/perl-role-tiny.mk
+++ b/package/perl-role-tiny/perl-role-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_ROLE_TINY_VERSION = 2.001004
+PERL_ROLE_TINY_VERSION = 2.002003
 PERL_ROLE_TINY_SOURCE = Role-Tiny-$(PERL_ROLE_TINY_VERSION).tar.gz
 PERL_ROLE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_ROLE_TINY_LICENSE = Artistic or GPL-1.0+
