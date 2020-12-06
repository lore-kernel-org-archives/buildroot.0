From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  6 Dec 2020 14:56:06 +0100
Subject: [Buildroot] [PATCH 2/3] package/flare-engine: bump to version 1.11
In-Reply-To: <20201206135607.667917-1-romain.naour@gmail.com>
References: <20201206135607.667917-1-romain.naour@gmail.com>
Message-ID: <20201206135607.667917-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/flare-engine/flare-engine.hash | 2 +-
 package/flare-engine/flare-engine.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/flare-engine/flare-engine.hash b/package/flare-engine/flare-engine.hash
index e03bcc589e..0e37a71922 100644
--- a/package/flare-engine/flare-engine.hash
+++ b/package/flare-engine/flare-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4bbd4674513b643be6294188904665c53f0ef2912e803212c05e8fd22a44d74d  flare-engine-1.0.tar.gz
+sha256  035ffd936d9e120dc2eb792779a0b7ff64574d4a29a1124946deaf7946d1059d  flare-engine-1.11.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index ed9dd19b0e..e2f3eefa28 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLARE_ENGINE_VERSION = 1.0
-FLARE_ENGINE_SITE =  $(call github,clintbellanger,flare-engine,v$(FLARE_ENGINE_VERSION))
+FLARE_ENGINE_VERSION = 1.11
+FLARE_ENGINE_SITE =  $(call github,flareteam,flare-engine,v$(FLARE_ENGINE_VERSION))
 FLARE_ENGINE_LICENSE = GPL-3.0+
 FLARE_ENGINE_LICENSE_FILES = COPYING
 
-- 
2.25.4
