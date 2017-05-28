From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 16:13:42 +0200
Subject: [Buildroot] [git commit] package/font-awesome: bump version to 4.7.0
Message-ID: <20170601202858.B6F49818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcdd5e363b4033d49de76bfff8913a356e39a84e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/font-awesome/font-awesome.hash | 2 +-
 package/font-awesome/font-awesome.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/font-awesome/font-awesome.hash b/package/font-awesome/font-awesome.hash
index 9f3715e..e266168 100644
--- a/package/font-awesome/font-awesome.hash
+++ b/package/font-awesome/font-awesome.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  7813f416057da622b16229b10fef550e1dc64c5bb59871cd38fa86e76dfdbae8  font-awesome-v4.5.0.tar.gz
+sha256 de512ba0e1dead382bbfce372cde74b3f18971d876fffb635ee9333f0db05d43  font-awesome-v4.7.0.tar.gz
diff --git a/package/font-awesome/font-awesome.mk b/package/font-awesome/font-awesome.mk
index 8933783..f394010 100644
--- a/package/font-awesome/font-awesome.mk
+++ b/package/font-awesome/font-awesome.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FONT_AWESOME_VERSION = v4.5.0
+FONT_AWESOME_VERSION = v4.7.0
 FONT_AWESOME_SITE = $(call github,FortAwesome,Font-Awesome,$(FONT_AWESOME_VERSION))
 FONT_AWESOME_LICENSE = OFL-1.1 (font), MIT (CSS, LESS and Sass files)
 FONT_AWESOME_DIRECTORIES_LIST = css fonts less scss
