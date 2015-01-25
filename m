From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jan 2015 15:23:07 +0100
Subject: [Buildroot] [git commit] perl-mojolicious: bump to version 5.72
Message-ID: <20150125142313.7B0658046B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=03439359504089961b603fbee58ae0979045da1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl-mojolicious/perl-mojolicious.hash |    3 +++
 package/perl-mojolicious/perl-mojolicious.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
new file mode 100644
index 0000000..a6d7703
--- /dev/null
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    797f28b188dec6e6a899b9b481ee8228 Mojolicious-5.72.tar.gz
+sha256 323218db02890a0b5e5d756f663ad32dbf312d05aa564b06d0a927e4a6a434d4 Mojolicious-5.72.tar.gz
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 1fa77b7..cb633d6 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 5.54
+PERL_MOJOLICIOUS_VERSION = 5.72
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_DEPENDENCIES = perl
