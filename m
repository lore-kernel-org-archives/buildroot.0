From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Jun 2017 19:47:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/glm: bump version to 0.9.8.4
Message-ID: <20170603174753.10433-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/glm/glm.hash | 2 +-
 package/glm/glm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index 30bb92378..c87d4ca2f 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 39c7ee0db54289f78350c7629ea2531664d71c6a494bbb86db48a86536de9ff2  glm-0.9.5.4.tar.gz
+sha256 a220e60f8711265595be3221e530d632d5823641ecd46a3a54bc174933bff14c  glm-0.9.8.4.tar.gz
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index ff9423da1..1f23146dd 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLM_VERSION = 0.9.5.4
+GLM_VERSION = 0.9.8.4
 GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
 GLM_LICENSE = MIT
 GLM_LICENSE_FILES = copying.txt
-- 
2.11.0
