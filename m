From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2015 22:19:19 +0200
Subject: [Buildroot] [git commit branch/next] evtest: bump version to 1.33
Message-ID: <20150808105643.1DC407FD83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fef8e3552dcfe4ac2a859ce0987ad42d406db141
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/evtest/evtest.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 1573f52..3e02f7c 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVTEST_VERSION = 1.32
+EVTEST_VERSION = 1.33
 EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.gz
 EVTEST_SITE = http://cgit.freedesktop.org/evtest/snapshot
 EVTEST_LICENSE = GPLv2+
