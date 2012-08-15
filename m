From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 18:07:04 +0200
Subject: [Buildroot] [git commit branch/next] microperl: add license info
Message-ID: <20120815180000.DB011971BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c801c99dcf2f84f642a27a11b9d2458106d4afc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/microperl/microperl.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/microperl/microperl.mk b/package/microperl/microperl.mk
index fbf319c..b2a912a 100644
--- a/package/microperl/microperl.mk
+++ b/package/microperl/microperl.mk
@@ -7,6 +7,8 @@
 MICROPERL_VERSION = 5.12.4
 MICROPERL_SITE = http://www.cpan.org/src/5.0
 MICROPERL_SOURCE = perl-$(MICROPERL_VERSION).tar.bz2
+MICROPERL_LICENSE = Artistic
+MICROPERL_LICENSE_FILES = Artistic
 MICROPERL_DEPENDENCIES = host-microperl
 MICROPERL_MODS_DIR = /usr/lib/perl5/$(MICROPERL_VERSION)
 MICROPERL_ARCH_DIR = $(MICROPERL_MODS_DIR)/$(GNU_TARGET_NAME)
