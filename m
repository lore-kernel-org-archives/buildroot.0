From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:09:12 +0200
Subject: [Buildroot] [git commit] package/glm: bump version to 0.9.9.5
Message-ID: <20190410172059.E03A28476B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e9f6f359046031e9fea6e5fe6760e8f285296ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glm/glm.hash | 2 +-
 package/glm/glm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glm/glm.hash b/package/glm/glm.hash
index 9d5c94301d..2073d6bf04 100644
--- a/package/glm/glm.hash
+++ b/package/glm/glm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 3a073eb8f3be07cee74481db0e1f78eda553b554941e405c863ab64de6a2e954  glm-0.9.9.4.tar.gz
+sha256 5e33b6131cea6a904339734b015110d4342b7dc02d995164fdb86332d28a5aa4  glm-0.9.9.5.tar.gz
 sha256 337130631a714eeae017556cad101d5324c2961214120b6214741d3d43667086  manual.md
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
index e15d4fea49..3ef106a943 100644
--- a/package/glm/glm.mk
+++ b/package/glm/glm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLM_VERSION = 0.9.9.4
+GLM_VERSION = 0.9.9.5
 GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
 GLM_LICENSE = MIT
 GLM_LICENSE_FILES = manual.md
