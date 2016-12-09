From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  9 Dec 2016 09:56:46 -0300
Subject: [Buildroot] [PATCH] mpv: bump to version 0.22.0
Message-ID: <1481288206-27613-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mpv/mpv.hash | 2 +-
 package/mpv/mpv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpv/mpv.hash b/package/mpv/mpv.hash
index fb287ef..be6b559 100644
--- a/package/mpv/mpv.hash
+++ b/package/mpv/mpv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	fe6ec9d2ded5ce84b963f54b812d579d04f944f4a737f3ae639c4d5d9e842b56	v0.20.0.tar.gz
+sha256	c0f9ac8f0e37a391d19007b333ef8787c2f45d75a0d4401c0098cde52c5082f6	v0.22.0.tar.gz
diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 0dd488d..1eb83e9 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPV_VERSION = 0.20.0
+MPV_VERSION = 0.22.0
 MPV_SITE = https://github.com/mpv-player/mpv/archive
 MPV_SOURCE = v$(MPV_VERSION).tar.gz
 MPV_DEPENDENCIES = \
-- 
2.7.3
