From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Dec 2016 09:28:27 +0100
Subject: [Buildroot] [git commit] mimic: fix legal info
Message-ID: <20161211083337.1B9A880F3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5479be52cd3362aa886a0bb100fb978462deb46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Name of license file is 'COPYING'.

Fixes:
  http://autobuild.buildroot.net/results/846/846b42d484e8d3e261eb3699a485d589f6bbab62

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mimic/mimic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mimic/mimic.mk b/package/mimic/mimic.mk
index 66fe9a9..2d24656 100644
--- a/package/mimic/mimic.mk
+++ b/package/mimic/mimic.mk
@@ -7,7 +7,7 @@
 MIMIC_VERSION = 1.1.0
 MIMIC_SITE = $(call github,MycroftAI,mimic,$(MIMIC_VERSION))
 MIMIC_LICENSE = MIT
-MIMIC_LICENSE_FILES = LICENSE
+MIMIC_LICENSE_FILES = COPYING
 
 MIMIC_DEPENDENCIES = host-pkgconf
 
