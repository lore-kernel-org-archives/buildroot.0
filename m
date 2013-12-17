From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Dec 2013 10:36:32 +0100
Subject: [Buildroot] [git commit] bustle: bump version
Message-ID: <20131217093658.2DB079C0CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0469f5bac47ec1434fa2e54a01c9f287a729e81
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bustle/bustle.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
index 68b7b24..2330c08 100644
--- a/package/bustle/bustle.mk
+++ b/package/bustle/bustle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSTLE_VERSION = 0.4.2
+BUSTLE_VERSION = 0.4.3
 BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)/
 BUSTLE_LICENSE = LGPLv2.1+
 BUSTLE_LICENSE_FILES = LICENSE
