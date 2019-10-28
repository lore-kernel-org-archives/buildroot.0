From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 29 Oct 2019 00:00:35 +0100
Subject: [Buildroot] [git commit] package/perl-role-tiny: bump to version
 2.001004
Message-ID: <20191028225558.432BB8C55A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8efec5987cf31f82d1957497a8669cd23dc802ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl-role-tiny/perl-role-tiny.hash | 4 ++--
 package/perl-role-tiny/perl-role-tiny.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-role-tiny/perl-role-tiny.hash b/package/perl-role-tiny/perl-role-tiny.hash
index fa28028fcc..c05873e653 100644
--- a/package/perl-role-tiny/perl-role-tiny.hash
+++ b/package/perl-role-tiny/perl-role-tiny.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    b1c5019b300d8acf7d6ddb7f312814fd Role-Tiny-2.000008.tar.gz
-sha256 b1541fc5e3e0eb2dbd55b25c432293c197e0153c2c9f7747deba4df72c27146a Role-Tiny-2.000008.tar.gz
+md5    98446826608b1e943e65c1f6e35942fe Role-Tiny-2.001004.tar.gz
+sha256 92ba5712850a74102c93c942eb6e7f62f7a4f8f483734ed289d08b324c281687 Role-Tiny-2.001004.tar.gz
 
 # computed by scancpan
 sha256 88f4a8719c584d756dcfeebc7f35643066354188bfb57c672fbafcd44e044e9c LICENSE
diff --git a/package/perl-role-tiny/perl-role-tiny.mk b/package/perl-role-tiny/perl-role-tiny.mk
index f18fd0bed8..0e1974fa1f 100644
--- a/package/perl-role-tiny/perl-role-tiny.mk
+++ b/package/perl-role-tiny/perl-role-tiny.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_ROLE_TINY_VERSION = 2.000008
+PERL_ROLE_TINY_VERSION = 2.001004
 PERL_ROLE_TINY_SOURCE = Role-Tiny-$(PERL_ROLE_TINY_VERSION).tar.gz
 PERL_ROLE_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
 PERL_ROLE_TINY_LICENSE = Artistic or GPL-1.0+
