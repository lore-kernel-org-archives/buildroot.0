From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:49:25 +0200
Subject: [Buildroot] [git commit] package/glm: bump version to 0.9.8.4
Message-ID: <20170604075142.E284E8270B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28708f18a634d4e36205af321bc7bf0544e228b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glm/glm.hash | 2 +-
 package/glm/glm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index 30bb923..c87d4ca 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 39c7ee0db54289f78350c7629ea2531664d71c6a494bbb86db48a86536de9ff2  glm-0.9.5.4.tar.gz
+sha256 a220e60f8711265595be3221e530d632d5823641ecd46a3a54bc174933bff14c  glm-0.9.8.4.tar.gz
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index ff9423d..1f23146 100644
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
