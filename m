From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Mar 2019 18:48:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/omxplayer: bump to version
 f06235cc9690a6d58187514452df8cf8fcdaacec
Message-ID: <20190330174833.19097-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Fix build with ffmpeg 4.x
- Update hash of license file, GPL mailing address was fixed:
  https://github.com/popcornmix/omxplayer/commit/5da1379efc32878b6151110aef73f91b6c433cdb

Fixes:
 - http://autobuild.buildroot.org/results/e413c9b2ad7b97f0552f2477293ca5fe861df06c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/omxplayer/omxplayer.hash | 6 +++---
 package/omxplayer/omxplayer.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/omxplayer/omxplayer.hash b/package/omxplayer/omxplayer.hash
index ad084e2643..fcbf730ab3 100644
--- a/package/omxplayer/omxplayer.hash
+++ b/package/omxplayer/omxplayer.hash
@@ -1,6 +1,6 @@
 # Locally computed:
-sha1    258316ff94a1f1e5e47a5bb1a28d324ab08871a9                          omxplayer-2ee17b22a6149a043a2e402580504f282c615373.tar.gz
-sha256  c16498258ee78c59f9705b621e4b5b7b0673e1687d94681f9dc52451b1ceba48  omxplayer-2ee17b22a6149a043a2e402580504f282c615373.tar.gz
+sha1    a9106203f822fe88eb35980479f46a555086d4a7                          omxplayer-f06235cc9690a6d58187514452df8cf8fcdaacec.tar.gz
+sha256  af2d9450f8947842ea8c401fe9f71eec444013ebbdee29f2ac828c9c493c1329  omxplayer-f06235cc9690a6d58187514452df8cf8fcdaacec.tar.gz
 
 # Hash for license file:
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  60e78ba9f921bb06bcf957575245414b1577c9688a63ddd73bc65f9d48fe31c9  COPYING
diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
index 6999269161..072274cdfc 100644
--- a/package/omxplayer/omxplayer.mk
+++ b/package/omxplayer/omxplayer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMXPLAYER_VERSION = 2ee17b22a6149a043a2e402580504f282c615373
+OMXPLAYER_VERSION = f06235cc9690a6d58187514452df8cf8fcdaacec
 OMXPLAYER_SITE = $(call github,popcornmix,omxplayer,$(OMXPLAYER_VERSION))
 OMXPLAYER_LICENSE = GPL-2.0+
 OMXPLAYER_LICENSE_FILES = COPYING
-- 
2.20.1
