From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 13:04:13 +0200
Subject: [Buildroot] [git commit branch/next] openzwave: bump to version 1.5
Message-ID: <20160816110755.886AE82132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f5cfefffda6a5aab7efc83bc295672d558401e54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openzwave/openzwave.hash | 2 +-
 package/openzwave/openzwave.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openzwave/openzwave.hash b/package/openzwave/openzwave.hash
index bab940e..cd1231f 100644
--- a/package/openzwave/openzwave.hash
+++ b/package/openzwave/openzwave.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	ca122365f6237dc245be0129eb460e78126976b9c7bd06487795d3acfc9f2a5f	openzwave-v1.4.tar.gz
+sha256	abfb4c7e7728e86ba374c2e0ef7de912594eb24a8c44935457352df844530238	openzwave-V1.5.tar.gz
diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index c8892a9..2723086 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENZWAVE_VERSION = v1.4
+OPENZWAVE_VERSION = V1.5
 OPENZWAVE_SITE = $(call github,OpenZWave,open-zwave,$(OPENZWAVE_VERSION))
 OPENZWAVE_LICENSE = LGPLv3+, GPLv3 (examples), Apache-2.0 (sh2ju.sh)
 OPENZWAVE_LICENSE_FILES = license/license.txt license/lgpl.txt \
