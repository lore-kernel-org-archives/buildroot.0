From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 29 Feb 2020 15:20:15 -0800
Subject: [Buildroot] [PATCH/next 1/1] package/ncurses: bump to version 6.2
Message-ID: <20200229232016.4174325-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Other changes:
  - Update hash for the license file due to copyright year changes.
  - Remove patches that are incorporated in this version.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
All checks pass:
          br-arm-full [1/6]: OK
br-arm-cortex-a9-glibc [2/6]: OK
 br-arm-cortex-m4-full [3/6]: OK
        br-x86-64-musl [4/6]: OK
    br-arm-full-static [5/6]: OK
          sourcery-arm [6/6]: OK

 package/ncurses/ncurses.hash | 39 ++---------------------------------
 package/ncurses/ncurses.mk   | 40 +-----------------------------------
 2 files changed, 3 insertions(+), 76 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 69115f5caf..429395c0f7 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,39 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17  ncurses-6.1.tar.gz
-sha256  cf9038be62c49a6b5fe93f33b32f983649b2f4c4c31cc99bd18e1e5871c31443  ncurses-6.1-20190609-patch.sh.bz2
-sha256  4b0a4c6abce4543ac4fd4c3389b14825e73b7cddcbb01a687c5dd837f21a3b04  ncurses-6.1-20190615.patch.gz
-sha256  b2302625ec2fa6dce79622670452e56ff6130dc02e655b52177264cfeff84c51  ncurses-6.1-20190623.patch.gz
-sha256  48b004a3e5409a02a5e751f996fe487f5ce45be1fff38572f7cc8167b22179bf  ncurses-6.1-20190630.patch.gz
-sha256  faf849eed92161ac09782badf84a19ad6beae472e87d460905865e08a6ed46e4  ncurses-6.1-20190706.patch.gz
-sha256  62d4954bf818659105aa1c21cc27cb2c133e02bdc7d3f6aa548caae2d1db7440  ncurses-6.1-20190713.patch.gz
-sha256  0c1a54bd5de9c890d1fabcfa92bf5bf46f7eccc54a48051367e82bdb29636450  ncurses-6.1-20190720.patch.gz
-sha256  0bbd08d3bd12686d4427c242d6a8fde2e299698039cd597303af713c5f538f17  ncurses-6.1-20190727.patch.gz
-sha256  40e5f350a921dbd03e3d9ff93bc477ec4f1f65878f307c534882fba3b0b40507  ncurses-6.1-20190728.patch.gz
-sha256  9648104311e209d17db9556d6efc898d5c80ed5fc80e8aa3cd08769544c839b8  ncurses-6.1-20190803.patch.gz
-sha256  fa1f583575717b2538d3a4ea59a67bc17dd07ed46cb99fe2beaf23d1b006e9df  ncurses-6.1-20190810.patch.gz
-sha256  5e9ae4f1b3e2e2d567a01a8fb2c9b7f3804cae97f28cd483d239afee781b8c2b  ncurses-6.1-20190817.patch.gz
-sha256  7592e5e610b3e9eeca78897da2330b7518f00e0a59d20df873c88a9b26bc4da9  ncurses-6.1-20190824.patch.gz
-sha256  1a9800a5ccc4f2cb572b63cdc8f1431642e014a58a30151af73977614d5c4aac  ncurses-6.1-20190831.patch.gz
-sha256  87685a6b90225efcd03375eb11b124fd9e95ee4b0f36bcbc82e56a70cd466b33  ncurses-6.1-20190907.patch.gz
-sha256  4ddebb6e0e5a67028eb3aca2352c9bd48cf122a512719f93e449e00a3c6634f8  ncurses-6.1-20190914.patch.gz
-sha256  4c725fa729d754f4e75af78fda4cf67d60e71c1625b5f4f49b7930c95bb8dd36  ncurses-6.1-20190921.patch.gz
-sha256  a830b879b57906b1e480e4785b32cec05081b7849c06c4b116459c4d343ba21b  ncurses-6.1-20190928.patch.gz
-sha256  d5eae35d920409613f565825e1e215fed89828040aab541328455da38e1a9b7c  ncurses-6.1-20191005.patch.gz
-sha256  136dbd07254810728c1fcb7614b566e7c3cb6af8c0783019bbb6b4b5e3c1e2c6  ncurses-6.1-20191012.patch.gz
-sha256  1d5125b20792e9f534432c3ef2aa68984c713416addeb2c4364c5ae897a3b8b7  ncurses-6.1-20191015.patch.gz
-sha256  a6475c05312ba0b12b72b83529c1d283a14c4470414c505fa45451e35f3ffcf5  ncurses-6.1-20191019.patch.gz
-sha256  f6c7469f33065faf1d04ac9e9bea1a88142b00b82e3db3674cca9ec24920b4af  ncurses-6.1-20191026.patch.gz
-sha256  0d0443937b9c04663de25b405bb95e658e7c87e1dd7a726b3813aa7f9b55f69a  ncurses-6.1-20191102.patch.gz
-sha256  f3b75787918d2f02a2005877e81fdc054c45b8249b43aabb531e3b817bcf7576  ncurses-6.1-20191109.patch.gz
-sha256  801d138b55986719aea7f42dc8c0cb618fa9a6edf92d1789a6ba5d61678f7761  ncurses-6.1-20191116.patch.gz
-sha256  45f447cf2c7a24295c7b9210473e943a238c57ca80581d121c9a1a3aa05332a6  ncurses-6.1-20191123.patch.gz
-sha256  ea758e3b0162348c4d5d6dac56f95809da3b7d0589205661a13430eb93f72f75  ncurses-6.1-20191130.patch.gz
-sha256  16b5a588c56a53c468d2359b21d5d8a007c4ef7696de12c964a1b661ed185f72  ncurses-6.1-20191207.patch.gz
-sha256  8725a2dc8f1cfdab41cb5fe56f930e070f8cdc81a77f303ef2658f65cd0b8edd  ncurses-6.1-20191214.patch.gz
-sha256  7e2a06fb0af6c84269d23ffe06c689bf1a8a57af39369690ee0698778d4b6cda  ncurses-6.1-20191221.patch.gz
-sha256  d052bcdb38f8b45a00c0a3190dec7ac1e72d5682f3a16d8accda239308aad62f  ncurses-6.1-20191228.patch.gz
-sha256  7b6253bae438154a88c7f3e301b872ed7ad71f943c873f4e6c82d8d36a5df72b  ncurses-6.1-20200104.patch.gz
-sha256  e438f28025c7d97c7f8fabf40eeab68bbf8ca871a0ba349e3fdec9165efe85cb  ncurses-6.1-20200111.patch.gz
-sha256  06d002c33f727c4a36a0b502c226ea3c3c5b80770703d2f783fffa6a0db04d92  ncurses-6.1-20200118.patch.gz
+sha256  30306e0c76e0f9f1f0de987cf1c82a5c21e1ce6568b9227f7da5b71cbea86c9d  ncurses-6.2.tar.gz
 # Locally computed
-sha256  4d1fde61868c73776a539366dccf5d5a4857e7fd7299efb1f02e07c2afe9ea87  COPYING
+sha256  8d8caaec335cbd1da15d5e9c12cd559f6d0d5566273077cc6f651684092606b5  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index c11650c766..43f8972b95 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -4,51 +4,13 @@
 #
 ################################################################################
 
-NCURSES_VERSION = 6.1
+NCURSES_VERSION = 6.2
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = COPYING
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)6-config
-NCURSES_PATCH = \
-	$(addprefix https://invisible-mirror.net/archives/ncurses/$(NCURSES_VERSION)/, \
-		ncurses-6.1-20190609-patch.sh.bz2 \
-		ncurses-6.1-20190615.patch.gz \
-		ncurses-6.1-20190623.patch.gz \
-		ncurses-6.1-20190630.patch.gz \
-		ncurses-6.1-20190706.patch.gz \
-		ncurses-6.1-20190713.patch.gz \
-		ncurses-6.1-20190720.patch.gz \
-		ncurses-6.1-20190727.patch.gz \
-		ncurses-6.1-20190728.patch.gz \
-		ncurses-6.1-20190803.patch.gz \
-		ncurses-6.1-20190810.patch.gz \
-		ncurses-6.1-20190817.patch.gz \
-		ncurses-6.1-20190824.patch.gz \
-		ncurses-6.1-20190831.patch.gz \
-		ncurses-6.1-20190907.patch.gz \
-		ncurses-6.1-20190914.patch.gz \
-		ncurses-6.1-20190921.patch.gz \
-		ncurses-6.1-20190928.patch.gz \
-		ncurses-6.1-20191005.patch.gz \
-		ncurses-6.1-20191012.patch.gz \
-		ncurses-6.1-20191015.patch.gz \
-		ncurses-6.1-20191019.patch.gz \
-		ncurses-6.1-20191026.patch.gz \
-		ncurses-6.1-20191102.patch.gz \
-		ncurses-6.1-20191109.patch.gz \
-		ncurses-6.1-20191116.patch.gz \
-		ncurses-6.1-20191123.patch.gz \
-		ncurses-6.1-20191130.patch.gz \
-		ncurses-6.1-20191207.patch.gz \
-		ncurses-6.1-20191214.patch.gz \
-		ncurses-6.1-20191221.patch.gz \
-		ncurses-6.1-20191228.patch.gz \
-		ncurses-6.1-20200104.patch.gz \
-		ncurses-6.1-20200111.patch.gz \
-		ncurses-6.1-20200118.patch.gz \
-	)
 
 NCURSES_CONF_OPTS = \
 	--without-cxx \
-- 
2.24.1
