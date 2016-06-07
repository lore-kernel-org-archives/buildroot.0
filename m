From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 23:44:56 +0200
Subject: [Buildroot] [git commit] package/miraclecast: bump version
Message-ID: <20160607214727.B814B81E61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac19e6a014a71e9264e12c5534b816d388ae17d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/miraclecast/miraclecast.hash | 2 +-
 package/miraclecast/miraclecast.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/miraclecast/miraclecast.hash b/package/miraclecast/miraclecast.hash
index 2a92cbf..97c68d0 100644
--- a/package/miraclecast/miraclecast.hash
+++ b/package/miraclecast/miraclecast.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 deef87155ed07bcf737260c29599e886bd248b573e72ba167369df93acb1fa61 miraclecast-8b61f733da124ccbfd1b85e188581fad1c41c1e1.tar.gz
+sha256 e11440f782519663db367285dd54b53eb5feb78682dac42bd90230222de9f0fd miraclecast-c94be167c85c6ec8badd7ac79e3dea2e0b73225c.tar.gz
diff --git a/package/miraclecast/miraclecast.mk b/package/miraclecast/miraclecast.mk
index 598dbd5..17e73f1 100644
--- a/package/miraclecast/miraclecast.mk
+++ b/package/miraclecast/miraclecast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MIRACLECAST_VERSION = 8b61f733da124ccbfd1b85e188581fad1c41c1e1
+MIRACLECAST_VERSION = c94be167c85c6ec8badd7ac79e3dea2e0b73225c
 MIRACLECAST_SITE = $(call github,albfan,miraclecast,$(MIRACLECAST_VERSION))
 MIRACLECAST_LICENSE = LGPLv2.1+, GPLv2 (gdhcp)
 MIRACLECAST_LICENSE_FILES = COPYING LICENSE_gdhcp LICENSE_htable LICENSE_lgpl
