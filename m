From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Sep 2014 13:24:46 -0000
Subject: [Buildroot] [git commit] evetst: bump to version 1.32
Message-ID: <20140901132445.6AC9F9D5C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57ee07fcf22cbf8d994feaa6bca9ee2d65047b5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/evtest/evtest.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 23dd495..42a7999 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVTEST_VERSION = 1.31
+EVTEST_VERSION = 1.32
 EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.gz
 EVTEST_SITE = http://cgit.freedesktop.org/evtest/snapshot
 EVTEST_LICENSE = GPLv2+
