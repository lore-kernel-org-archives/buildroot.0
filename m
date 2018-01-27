From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Jan 2018 14:42:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to 1.6.20
Message-ID: <20180127134229.32330-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added license hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.hash | 23 +++++++++++++++++------
 package/freeswitch/freeswitch.mk   |  2 +-
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index ccda477a79..25421de99b 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,6 +1,17 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.19.tar.xz.md5
-md5 24b8ee769031ca152b76e6c17edd882b  freeswitch-1.6.19.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.19.tar.xz.sha1
-sha1 2a48f1f5ca0b24854f93e49a4728f79517a95a24  freeswitch-1.6.19.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.19.tar.xz.sha256
-sha256 e8d271a0d876ba4cca551682af0a4f5047bfd79438fcebdcc17d00711c04a8ff  freeswitch-1.6.19.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.20.tar.xz.md5
+md5 e9890a2d6ca6f58dd3fa440fdfbf91a0  freeswitch-1.6.20.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.20.tar.xz.sha1
+sha1 ce284b805e262504cbb1f74796785b4dfa70d5ac  freeswitch-1.6.20.tar.xz
+# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.6.20.tar.xz.sha256
+sha256 dbb0f73109171bd381772b247b8ef581f6a176964619082a1fe031b004086f6b  freeswitch-1.6.20.tar.xz
+# Locally computed
+sha256 10299420c1e8602c0daf5a59d022621cd72a9148d1f0f33501edb3db3445c7fe  COPYING
+sha256 e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
+sha256 1eefb2ea1db0af7729a9d8a27d7c65d8a37ab185393f935b029aac6828ce315a  libs/apr-util/LICENSE
+sha256 7d72a8aee2c4b1a084200487992a5d86f5df6b535727a14c1874918e99d24600  libs/libzrtp/src/zrtp_legal.c
+sha256 e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  libs/sofia-sip/COPYING
+sha256 b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  libs/sofia-sip/COPYRIGHTS
+sha256 366576cb0b869cd9e95a4882878607314650488ac635e5df0692180382e9666a  libs/spandsp/COPYING
+sha256 8defed37d52096ae14b60adc499c33d43975109bc265552ee67e9a888c634b93  libs/srtp/LICENSE
+sha256 fbd6fed7938541d2c809c0826225fc85e551fdbfa8732b10f0c87e0847acafd7  libs/tiff-4.0.2/COPYRIGHT
+sha256 ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/mod/codecs/mod_isac/LICENSE
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index defa00f47a..98f2f48356 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.6.19
+FREESWITCH_VERSION = 1.6.20
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).tar.xz
 FREESWITCH_SITE = http://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
-- 
2.11.0
