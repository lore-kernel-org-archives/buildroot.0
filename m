From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:35:27 +0100
Subject: [Buildroot] [git commit] lsof: add license info
Message-ID: <20121114214730.38DC299B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e3322e2c7ebe739aa67abfb0775f9b5e5e43a3b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lsof/lsof.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index fa55e6a..f74eca4 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -7,6 +7,10 @@
 LSOF_VERSION = 4.85
 LSOF_SOURCE = lsof_$(LSOF_VERSION).tar.bz2
 LSOF_SITE = ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
+LSOF_LICENSE = lsof license
+# License is repeated in each file, this is a relatively small one.
+# It is also defined in 00README, but that contains a lot of other cruft.
+LSOF_LICENSE_FILES = dialects/linux/dproto.h
 
 # Make certain full-blown lsof gets built after the busybox version (1.20+)
 LSOF_DEPENDENCIES += $(if $(BR2_PACKAGE_BUSYBOX),busybox)
