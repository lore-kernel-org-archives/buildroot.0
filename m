From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jul 2020 23:13:22 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/putty: security
 bump version to 0.74
Message-ID: <20200721210900.204257FB34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6daec18a7d2988cfe19f926a5662511fb15a10a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Reformatted hashes, added md5 hash provided by upstream.

Release notes:
https://lists.tartarus.org/pipermail/putty-announce/2020/000030.html

Fixes CVE-2020-14002:
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-14002

Updated license hash due to upstream commits adding copyright holders
and bumping the copyright year:
https://git.tartarus.org/?p=simon/putty.git;a=history;f=LICENCE;h=3e1d146289644749b3578f610c74715fa1c6bf0d;hb=HEAD

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c591d6c186317a0ac95b62de141375ba03449cb4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.hash | 11 ++++++-----
 package/putty/putty.mk   |  2 +-
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index 8600281efc..3885cef9b8 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,8 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.73/{sha1,sha256,sha512}sums
-sha1 17daebb82e476adfd578f6934c28f4d2c209b7d8  putty-0.73.tar.gz
-sha256 3db0b5403fb41aecd3aa506611366650d927650b6eb3d839ad4dcc782519df1c  putty-0.73.tar.gz
-sha512 4ada4b8c6d68be44afede2676bc661fedfd1ea0b574b8232ad9aaa6f3a48baa9f4f0ded2955b3f2677a14db85a508f53c965cb00fcd7538a1ed9844031f0c5e5  putty-0.73.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.74/{md5,sha1,sha256,sha512}sums
+md5  dbfa58f22a91b22b7489173e9dd09e30  putty-0.74.tar.gz
+sha1  17b160e9720f67f9af9399d7d185b913b81f18fe  putty-0.74.tar.gz
+sha256  ddd5d388e51dd9e6e294005b30037f6ae802239a44c9dc9808c779e6d11b847d  putty-0.74.tar.gz
+sha512  0da86849ea764cd88643bd2c1984ac7211ae72dd7c41232307b1960a29ca9518044b022d87c60272d6db71a3357026862a112bedb90ee732b41494fca3acde9b  putty-0.74.tar.gz
 
 # Locally calculated
-sha256 b517b4a9504ba0f651d5e590245197b88d9a81d073905cc798cc9464c5ca7ba8  LICENCE
+sha256  92028b6d56212bd3e4ce6a36bd2e2454851dca7e8ffe4c6ab51385ca214ca322  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 5313a4f8be..8f9564bc38 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.73
+PUTTY_VERSION = 0.74
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
