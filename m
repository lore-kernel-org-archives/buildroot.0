From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Apr 2014 18:53:33 +0200
Subject: [Buildroot] [git commit] lttng-libust: bump version to 2.4.1
Message-ID: <20140419165650.6B13C9C837@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a478fcd423dc9e905bfc92f0a2632049d83a4d7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

fixes:
http://autobuild.buildroot.net/results/a6f/a6f5550cc63260126cb66a954af60f1633b97faf/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-libust/lttng-libust.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 375a6a3..b6d1911 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LTTNG_LIBUST_SITE    = http://lttng.org/files/lttng-ust/
-LTTNG_LIBUST_VERSION = 2.4.0
+LTTNG_LIBUST_VERSION = 2.4.1
 LTTNG_LIBUST_SOURCE  = lttng-ust-$(LTTNG_LIBUST_VERSION).tar.bz2
 LTTNG_LIBUST_LICENSE = LGPLv2.1; MIT for system headers; GPLv2 for liblttng-ust-ctl/ustctl.c (used by lttng-sessiond)
 LTTNG_LIBUST_LICENSE_FILES = COPYING
