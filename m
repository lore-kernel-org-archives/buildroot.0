From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 14:50:42 +0200
Subject: [Buildroot] [git commit] mpv: bump version to 0.27.0
Message-ID: <20170924124820.747688004A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24a617f1b159abc6edd6771c7cc3ec8c9fea2de2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Includes some fixes for the Raspberry Pi, amongst many others.

Signed-off-by: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mpv/mpv.hash | 2 +-
 package/mpv/mpv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index 10a91cf..60fb843 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 07423ffad6921ec4da32f703cd7fbfb27012301dcb736ac8542ac8e6083b0bce  v0.25.0.tar.gz
+sha256 341d8bf18b75c1f78d5b681480b5b7f5c8b87d97a0d4f53a5648ede9c219a49c v0.27.0.tar.gz
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 37548c9..730ced6 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.25.0
+MPV_VERSION = 0.27.0
 MPV_SITE = https://github.com/mpv-player/mpv/archive
 MPV_SOURCE = v$(MPV_VERSION).tar.gz
 MPV_DEPENDENCIES = \
