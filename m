From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Sep 2017 22:20:09 +0200
Subject: [Buildroot] [git commit] s6-linux-init: bump version to 0.3.1.1
Message-ID: <20170912201316.E4AA6802CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f81b6695f2746968afa48068e248a8e5c43e6f2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

- http://autobuild.buildroot.net/results/7208b2630832c3293db39affd7886691691770b4
- http://autobuild.buildroot.net/results/c10548ffde2d83b6298759793ef99a5142309678
- http://autobuild.buildroot.net/results/a0da44d547670bc46479980ac1b29e7e2421b378
- http://autobuild.buildroot.net/results/df7ec3facb183b7caf1a6eaff4f89a65961681fb
- http://autobuild.buildroot.net/results/fe7a32fbec5d64c359ad0326a01764a631dcc6f6
- http://autobuild.buildroot.net/results/79029d736910ca32567bc8a82ac6982c3ac1e1fb
- http://autobuild.buildroot.net/results/20091ae932385bd7ba4205626bce174e385da221
- http://autobuild.buildroot.net/results/c1cd69444abb32e77928e7d7363f5cdfea79dcf5

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/s6-linux-init/s6-linux-init.hash | 2 +-
 package/s6-linux-init/s6-linux-init.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-linux-init/s6-linux-init.hash b/package/s6-linux-init/s6-linux-init.hash
index 80068ba..2ba3657 100644
--- a/package/s6-linux-init/s6-linux-init.hash
+++ b/package/s6-linux-init/s6-linux-init.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 d8854a01f41db88250b73bdff3a636ed31810b1c309acb2d724380c8b69aedd6  s6-linux-init-0.3.1.0.tar.gz
+sha256 9ee2e8a5abc250bcb2be7d07566592ba5cbe3abce858f60853d3ac45b1ccdd79  s6-linux-init-0.3.1.1.tar.gz
diff --git a/package/s6-linux-init/s6-linux-init.mk b/package/s6-linux-init/s6-linux-init.mk
index be968ba..c5dee02 100644
--- a/package/s6-linux-init/s6-linux-init.mk
+++ b/package/s6-linux-init/s6-linux-init.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_LINUX_INIT_VERSION = 0.3.1.0
+S6_LINUX_INIT_VERSION = 0.3.1.1
 S6_LINUX_INIT_SITE = http://skarnet.org/software/s6-linux-init
 S6_LINUX_INIT_LICENSE = ISC
 S6_LINUX_INIT_LICENSE_FILES = COPYING
