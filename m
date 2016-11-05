From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 23:34:02 +0100
Subject: [Buildroot] [git commit] package/pseudo: update version
Message-ID: <20161105223406.CE0DA7FFA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bafd08a1625d5ee3be0f5918919185f477dee008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Brings in a fix about externded attributes (xattrs).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pseudo/pseudo.hash | 2 +-
 package/pseudo/pseudo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pseudo/pseudo.hash b/package/pseudo/pseudo.hash
index 5822d0e..1553a29 100644
--- a/package/pseudo/pseudo.hash
+++ b/package/pseudo/pseudo.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  d7767c9a73b0df4f1f26952cf5eca4c6ff6fc4bc5ef15a904ea3839c70161936  pseudo-7abc9396731149df5eaf43c84fed4f3053b64de6.tar.gz
+sha256  7d4b767302f118fa1c3f89b551cf3f3f2aa92721dab86ff62f0600a394b8a81a  pseudo-45eca34c754d416a38bee90fb2d3c110a0b6cc5f.tar.gz
diff --git a/package/pseudo/pseudo.mk b/package/pseudo/pseudo.mk
index ed348f1..67538a6 100644
--- a/package/pseudo/pseudo.mk
+++ b/package/pseudo/pseudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSEUDO_VERSION = 7abc9396731149df5eaf43c84fed4f3053b64de6
+PSEUDO_VERSION = 45eca34c754d416a38bee90fb2d3c110a0b6cc5f
 PSEUDO_SITE = https://git.yoctoproject.org/git/pseudo
 PSEUDO_SITE_METHOD = git
 
