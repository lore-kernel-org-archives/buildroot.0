From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 22:37:27 +0200
Subject: [Buildroot] [git commit branch/next] package/freeswitch: bump
 version to 1.10.3
Message-ID: <20200515202118.C5FD99196D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3ad18e8d2ef83ee8c45363d33bdae91575838cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://mailchi.mp/freeswitch.com/freeswitch-v1103-has-just-been-released

Changelog:
https://github.com/signalwire/freeswitch/releases/tag/v1.10.3

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeswitch/freeswitch.hash | 36 ++++++++++++++++++------------------
 package/freeswitch/freeswitch.mk   |  2 +-
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index f300e69bf4..de6cb6462c 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,19 +1,19 @@
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.2.tar.xz.md5
-md5 89d66f87f0f6c2471aa95aee48f55fdc freeswitch-1.10.2.-release.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.2.tar.xz.sha1
-sha1 90dac82cb4fb8fc11e399fd4bdac7163fb40259b freeswitch-1.10.2.-release.tar.xz
-# From http://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.2.tar.xz.sha256
-sha256 1fd46dee82ecc52ac90ebab6bd454e34c64950fae7d6dc0589c8daa14bfc7d34 freeswitch-1.10.2.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.3.-release.tar.xz.md5
+md5  c7d570da3a6fc66c1a286a105680dabf freeswitch-1.10.3.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.3.-release.tar.xz.sha1
+sha1  98139cda8054ec840611c6fc3a585a5c5565ae4d freeswitch-1.10.3.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.3.-release.tar.xz.sha256
+sha256  2d7db07a64ee2f19f9b6e3a4ce76fa42e0fe46c29d95edf1b690a3df3729f307 freeswitch-1.10.3.-release.tar.xz
 # Locally computed
-sha256 75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
-sha256 c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
-sha256 e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
-sha256 1eefb2ea1db0af7729a9d8a27d7c65d8a37ab185393f935b029aac6828ce315a  libs/apr-util/LICENSE
-sha256 8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  libs/libvpx/LICENSE
-sha256 2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  libs/libyuv/LICENSE
-sha256 7d72a8aee2c4b1a084200487992a5d86f5df6b535727a14c1874918e99d24600  libs/libzrtp/src/zrtp_legal.c
-sha256 e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  libs/sofia-sip/COPYING
-sha256 b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  libs/sofia-sip/COPYRIGHTS
-sha256 366576cb0b869cd9e95a4882878607314650488ac635e5df0692180382e9666a  libs/spandsp/COPYING
-sha256 8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  libs/srtp/LICENSE
-sha256 ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/mod/codecs/mod_isac/LICENSE
+sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
+sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
+sha256  e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
+sha256  1eefb2ea1db0af7729a9d8a27d7c65d8a37ab185393f935b029aac6828ce315a  libs/apr-util/LICENSE
+sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  libs/libvpx/LICENSE
+sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  libs/libyuv/LICENSE
+sha256  7d72a8aee2c4b1a084200487992a5d86f5df6b535727a14c1874918e99d24600  libs/libzrtp/src/zrtp_legal.c
+sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  libs/sofia-sip/COPYING
+sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  libs/sofia-sip/COPYRIGHTS
+sha256  366576cb0b869cd9e95a4882878607314650488ac635e5df0692180382e9666a  libs/spandsp/COPYING
+sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  libs/srtp/LICENSE
+sha256  ab00a482b6a3902e40211b43c5d0441962ea99b6cc7c25c0f243fa270b78d482  src/mod/codecs/mod_isac/LICENSE
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 5985df4a6e..79467ed618 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.2
+FREESWITCH_VERSION = 1.10.3
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
