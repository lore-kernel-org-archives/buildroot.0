From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:44:52 +0100
Subject: [Buildroot] [git commit] package/b*: add license file hashes
Message-ID: <20200203133729.5F909888B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00c97c98dfcf9aeb566f07c4aefdc3347532ebeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bctoolbox/bctoolbox.hash           | 1 +
 package/bcusdk/bcusdk.hash                 | 3 ++-
 package/beecrypt/beecrypt.hash             | 1 +
 package/benejson/benejson.hash             | 1 +
 package/binutils/binutils.hash             | 4 ++++
 package/bitstream-vera/bitstream-vera.hash | 4 +++-
 package/bluez-tools/bluez-tools.hash       | 5 +++--
 package/boa/boa.hash                       | 1 +
 package/bonnie/bonnie.hash                 | 1 +
 package/bsdiff/bsdiff.hash                 | 2 ++
 10 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/package/bctoolbox/bctoolbox.hash b/package/bctoolbox/bctoolbox.hash
index 70be55c3d7..6242355ee2 100644
--- a/package/bctoolbox/bctoolbox.hash
+++ b/package/bctoolbox/bctoolbox.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  da7df7ff359a9829e9e6ef98dfe9fead0cf735b8a4a5da1b1047f467dee1b2a9  bctoolbox-0.4.0.tar.gz
+sha256  849dd903d98f12a964466ccfbaf3a1de1f94ad0ebd49a59d12f8ce4506f9f647  COPYING
diff --git a/package/bcusdk/bcusdk.hash b/package/bcusdk/bcusdk.hash
index 219498bcbb..a97062143d 100644
--- a/package/bcusdk/bcusdk.hash
+++ b/package/bcusdk/bcusdk.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	014cdaafc36f223c584b39ae5d698dd037a8e15aba4e78a2e531b51ff1331304  bcusdk_0.0.5.tar.gz
+sha256  014cdaafc36f223c584b39ae5d698dd037a8e15aba4e78a2e531b51ff1331304  bcusdk_0.0.5.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/beecrypt/beecrypt.hash b/package/beecrypt/beecrypt.hash
index e697c26f08..2f84007b45 100644
--- a/package/beecrypt/beecrypt.hash
+++ b/package/beecrypt/beecrypt.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  286f1f56080d1a6b1d024003a5fa2158f4ff82cae0c6829d3c476a4b5898c55d  beecrypt-4.2.1.tar.gz
+sha256  512d2d21b6b3384ba64781abb0208a1b87740bc31e2df48e2b206ddb7e4d5779  COPYING.LIB
diff --git a/package/benejson/benejson.hash b/package/benejson/benejson.hash
index 696dc4f3f6..437e1d9dd8 100644
--- a/package/benejson/benejson.hash
+++ b/package/benejson/benejson.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  2ce5f3c2323500bdf651e7fcaecbd1011997141e6067567b8d2caa4cf7182f4a  benejson-0.9.7.tar.gz
+sha256  d0b7dae881fcb18c4dddfd8b0c1643ae671d5f356d14ba5b4e95ca889cc9ec32  LICENSE
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index 82a4082104..797dd5b923 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -8,3 +8,7 @@ sha512  33ac5ad662db551870193f5c76c35a18de465adfa1c7f4bf5c1bb4145805a47507bf11ec
 
 # Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
 sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
+
+# locally computed
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/bitstream-vera/bitstream-vera.hash b/package/bitstream-vera/bitstream-vera.hash
index e18b38bb65..bb31b17a4a 100644
--- a/package/bitstream-vera/bitstream-vera.hash
+++ b/package/bitstream-vera/bitstream-vera.hash
@@ -1,2 +1,4 @@
 # From http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.tar.bz2.sha256sum
-sha256	db5b27df7bbb318036ebdb75acd3e98f1bd6eb6608fb70a67d478cd243d178dc	ttf-bitstream-vera-1.10.tar.bz2
+sha256  db5b27df7bbb318036ebdb75acd3e98f1bd6eb6608fb70a67d478cd243d178dc  ttf-bitstream-vera-1.10.tar.bz2
+# locally computed
+sha256  3361d054759a2fc686a2c058be82deaf9c2e6fe549be9004d7935a6c1736315d  COPYRIGHT.TXT
diff --git a/package/bluez-tools/bluez-tools.hash b/package/bluez-tools/bluez-tools.hash
index 214fa5bdff..8be058ea6a 100644
--- a/package/bluez-tools/bluez-tools.hash
+++ b/package/bluez-tools/bluez-tools.hash
@@ -1,3 +1,4 @@
 # Locally computed
-sha256 56204ddd1cc7890d60f6a47507755f786fa3ee28f1da370a32ca7d7e0795a953  bluez-tools-171181b6ef6c94aefc828dc7fd8de136b9f97532.tar.gz
-sha256 62ca98af63d2ae142dbc77995c6bd4c259eaba4a5832daa33ae9e3d585b9205f  bluez-tools-97efd293491ad7ec96a655665339908f2478b3d1.tar.gz
+sha256  56204ddd1cc7890d60f6a47507755f786fa3ee28f1da370a32ca7d7e0795a953  bluez-tools-171181b6ef6c94aefc828dc7fd8de136b9f97532.tar.gz
+sha256  62ca98af63d2ae142dbc77995c6bd4c259eaba4a5832daa33ae9e3d585b9205f  bluez-tools-97efd293491ad7ec96a655665339908f2478b3d1.tar.gz
+sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/boa/boa.hash b/package/boa/boa.hash
index 37760fd51d..4efe3aec43 100644
--- a/package/boa/boa.hash
+++ b/package/boa/boa.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256  02c51bf25f29d56e641b662f0767759654c28d88ec31f55c5a73d57edfe13cf6  boa-0.94.14rc21.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/bonnie/bonnie.hash b/package/bonnie/bonnie.hash
index acf00fdbe9..c8118e9d62 100644
--- a/package/bonnie/bonnie.hash
+++ b/package/bonnie/bonnie.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256	cb3866116634bf65760b6806be4afa7e24a1cad6f145c876df8721f01ba2e2cb  bonnie++-1.03e.tgz
+sha256  bdfeef85436885bc317fdbae3732b17a39e7910eb855553a83b4d2cf9032e773  copyright.txt
diff --git a/package/bsdiff/bsdiff.hash b/package/bsdiff/bsdiff.hash
index 989fcf1f12..2c6d02f4e3 100644
--- a/package/bsdiff/bsdiff.hash
+++ b/package/bsdiff/bsdiff.hash
@@ -1,2 +1,4 @@
 # From http://www.daemonology.net/bsdiff/:
 md5	e6d812394f0e0ecc8d5df255aa1db22a  bsdiff-4.3.tar.gz
+# locally computed
+sha256  fc0a6e634ef77dcf14bf36c7b6d1e57ba1ac5c4809073dfaacb3b5f7ab277eb7  bsdiff.c
