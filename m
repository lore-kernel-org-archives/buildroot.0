From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:11 +0100
Subject: [Buildroot] [PATCH 21/32] package/r*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-22-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/rabbitmq-server/rabbitmq-server.hash | 18 +++++++++++++++++-
 package/racehound/racehound.hash             |  1 +
 package/ramsmp/ramsmp.hash                   |  3 ++-
 package/ramspeed/ramspeed.hash               |  3 ++-
 package/ranger/ranger.hash                   |  4 +++-
 package/rapidxml/rapidxml.hash               |  3 ++-
 package/raptor/raptor.hash                   |  3 ++-
 package/ratpoison/ratpoison.hash             |  3 ++-
 package/read-edid/read-edid.hash             |  3 ++-
 package/rp-pppoe/rp-pppoe.hash               |  4 +++-
 package/rsh-redone/rsh-redone.hash           |  4 +++-
 package/rt-tests/rt-tests.hash               |  3 ++-
 package/rtl8188eu/rtl8188eu.hash             |  3 ++-
 package/rtl8821au/rtl8821au.hash             |  3 ++-
 14 files changed, 45 insertions(+), 13 deletions(-)

diff --git a/package/rabbitmq-server/rabbitmq-server.hash b/package/rabbitmq-server/rabbitmq-server.hash
index 3cd412dd0f..3c552820c1 100644
--- a/package/rabbitmq-server/rabbitmq-server.hash
+++ b/package/rabbitmq-server/rabbitmq-server.hash
@@ -1,2 +1,18 @@
 # Locally computed
-sha256 395689bcf57fd48aed452fcd43ff9a992de40067d3ea5c44e14680d69db7b78e  rabbitmq-server-3.6.6.tar.xz
+sha256  395689bcf57fd48aed452fcd43ff9a992de40067d3ea5c44e14680d69db7b78e  rabbitmq-server-3.6.6.tar.xz
+sha256  f3a296f863a2729506bf0e9f1b3f219e63ede4906a88790fdd4d696f825b70ba  LICENSE-MPL-RabbitMQ
+sha256  2d6485b111c3ef40900d5accb40388fbf99d4b018274b3617e1c92b86d95c985  LICENSE
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE-APACHE2-ExplorerCanvas
+sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE-APL2-Rebar
+sha256  b04c8850fdf64d17233f0acbe4eb632f03bd663094233c949bdbe788858bb841  LICENSE-APL2-Stomp-Websocket
+sha256  cdc8c5132e24712732282867575b23b951f277fe9641d72e730a264e8d8add2f  LICENSE-BSD-base64js
+sha256  2c7784c174b3eff8507a8cb815c721800882f6d53860c2f2ecf34c8ce2d510f1  LICENSE-BSD-glMatrix
+sha256  a97b529abfed8dea9f644e1d3294a14beba6aaf3a8e2f0db6a347e01ceb623cd  LICENSE-EPL-OTP
+sha256  b2614726fe57ee8267324ecfdebe6e578e5aaa5a77a7f84b9d26463c058147d1  LICENSE-MIT-EJS10
+sha256  e09d954054165670b6a669e6da59673d9e85f343b9983e92a220623ff0198f8c  LICENSE-MIT-Flot
+sha256  f10e24a690fa6f8a2154dd0b8623e0431c6c049482f139d0980664de612a7d5b  LICENSE-MIT-jQuery164
+sha256  fc93cc7361401413887f4c1349e4b0be4bcef936eaafbcc7485038abe197c692  LICENSE-MIT-Mochi
+sha256  363a3b367503176fad7fd794168193ff9add85c3d28b73af804b67ff11c59115  LICENSE-MIT-Mochiweb
+sha256  cfc50fa0d7ee02c2d71c8866ef211a4814e8c89c50b725d27e8bdf550291a9ed  LICENSE-MIT-Sammy060
+sha256  c29e506dd734930964382e52e98f60ab7a46c2be639165a3a25083272c8fc29f  LICENSE-MIT-SockJS
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE-MPL2
diff --git a/package/racehound/racehound.hash b/package/racehound/racehound.hash
index d9a7f061f7..fc64243047 100644
--- a/package/racehound/racehound.hash
+++ b/package/racehound/racehound.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  935bc4a7c7b645dee5b905f6e97d0db3f0ac4f48e71d15f4e3982811017ac43c  racehound-f09f06fcc3c77c8c5541be3ba5be80aa8148ce0c.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/ramsmp/ramsmp.hash b/package/ramsmp/ramsmp.hash
index 46aa3f10e7..c5e29a3900 100644
--- a/package/ramsmp/ramsmp.hash
+++ b/package/ramsmp/ramsmp.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	39fb15493fb3c293575746d56f6ab9faaa1d876d8b1f0d8e5a4042d2ace95839	ramsmp-3.5.0.tar.gz
+sha256  39fb15493fb3c293575746d56f6ab9faaa1d876d8b1f0d8e5a4042d2ace95839  ramsmp-3.5.0.tar.gz
+sha256  2c308cffbab01762f8f6b11725725a227080746ef865f2756c9c9e1591dddaad  LICENCE
diff --git a/package/ramspeed/ramspeed.hash b/package/ramspeed/ramspeed.hash
index 71052a3491..5a6bfe3eb2 100644
--- a/package/ramspeed/ramspeed.hash
+++ b/package/ramspeed/ramspeed.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	f84e2e42b2b6b221ef9b586f6ae63d863db4ff21858e0ce7c84622a7c9522950	ramspeed-2.6.0.tar.gz
+sha256  f84e2e42b2b6b221ef9b586f6ae63d863db4ff21858e0ce7c84622a7c9522950  ramspeed-2.6.0.tar.gz
+sha256  2c308cffbab01762f8f6b11725725a227080746ef865f2756c9c9e1591dddaad  LICENCE
diff --git a/package/ranger/ranger.hash b/package/ranger/ranger.hash
index 30bdbede04..dee088f229 100644
--- a/package/ranger/ranger.hash
+++ b/package/ranger/ranger.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 94f6e342daee4445f15db5a7440a11138487c49cc25da0c473bbf1b8978f5b79 ranger-1.7.2.tar.gz
+sha256  94f6e342daee4445f15db5a7440a11138487c49cc25da0c473bbf1b8978f5b79  ranger-1.7.2.tar.gz
+# Locally computed
+sha256  fa3b40d44066b033ac8a134b792a4a4a1915aa7bc7757098e0f67080648a3271  AUTHORS
diff --git a/package/rapidxml/rapidxml.hash b/package/rapidxml/rapidxml.hash
index 81919f0373..398bc147c2 100644
--- a/package/rapidxml/rapidxml.hash
+++ b/package/rapidxml/rapidxml.hash
@@ -3,4 +3,5 @@ sha1 f5fd4fbc5ad7e96045313697811d65ea8089a950 rapidxml-1.13.zip
 md5 7b4b42c9331c90aded23bb55dc725d6a rapidxml-1.13.zip
 
 # Locally calculated
-sha256	c3f0b886374981bb20fabcf323d755db4be6dba42064599481da64a85f5b3571  rapidxml-1.13.zip
+sha256  c3f0b886374981bb20fabcf323d755db4be6dba42064599481da64a85f5b3571  rapidxml-1.13.zip
+sha256  794bf3b2ecf5cf0c740ac6c524d66ce6284c4b1de1f983d21a242b8abbeb9720  license.txt
diff --git a/package/raptor/raptor.hash b/package/raptor/raptor.hash
index ee7a71b4cf..2a54bf270d 100644
--- a/package/raptor/raptor.hash
+++ b/package/raptor/raptor.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed raptor2-2.0.15.tar.gz
+sha256  ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed  raptor2-2.0.15.tar.gz
+sha256  6b926a47abfb87451c436fbd4a868defec963d0232c70b806ac02d4a2a6e1968  LICENSE.txt
diff --git a/package/ratpoison/ratpoison.hash b/package/ratpoison/ratpoison.hash
index 44781b07a4..d003fadffd 100644
--- a/package/ratpoison/ratpoison.hash
+++ b/package/ratpoison/ratpoison.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 d98fa4be025ecca453c407ff311ab3949f29f20d6d8abedf8f0716b85fc8d1f1 ratpoison-1.4.9.tar.xz
+sha256  d98fa4be025ecca453c407ff311ab3949f29f20d6d8abedf8f0716b85fc8d1f1  ratpoison-1.4.9.tar.xz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/read-edid/read-edid.hash b/package/read-edid/read-edid.hash
index 30052171e1..d09110949a 100644
--- a/package/read-edid/read-edid.hash
+++ b/package/read-edid/read-edid.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 c7c6d8440f5b90f98e276829271ccea5b2ff5a3413df8a0f87ec09f834af186f read-edid-3.0.2.tar.gz
+sha256  c7c6d8440f5b90f98e276829271ccea5b2ff5a3413df8a0f87ec09f834af186f  read-edid-3.0.2.tar.gz
+sha256  1f8e8a59865d73076ab0a015330bc5bde7332384281260093878a3c366b778b7  LICENSE
diff --git a/package/rp-pppoe/rp-pppoe.hash b/package/rp-pppoe/rp-pppoe.hash
index 0cf85a089a..3f7af60558 100644
--- a/package/rp-pppoe/rp-pppoe.hash
+++ b/package/rp-pppoe/rp-pppoe.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	00794e04031546b0e9b8cf286f2a6d1ccfc4a621b2a3abb2d7ef2a7ab7cc86c2	rp-pppoe-3.12.tar.gz
+sha256  00794e04031546b0e9b8cf286f2a6d1ccfc4a621b2a3abb2d7ef2a7ab7cc86c2  rp-pppoe-3.12.tar.gz
+# Locally computed
+sha256  464006ba771074f4022db14f58a29a0b447b6fdde9529cf0331be396b6279162  doc/LICENSE
diff --git a/package/rsh-redone/rsh-redone.hash b/package/rsh-redone/rsh-redone.hash
index ba85607df7..559ed42d49 100644
--- a/package/rsh-redone/rsh-redone.hash
+++ b/package/rsh-redone/rsh-redone.hash
@@ -1,2 +1,4 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/r/rsh-redone/rsh-redone_85-2.dsc
-sha256	55ac8ee2acacbc3490f073e3922c0cde46ffe4ea3c593e05c48fed4c1e1a8811	rsh-redone_85.orig.tar.gz
+sha256  55ac8ee2acacbc3490f073e3922c0cde46ffe4ea3c593e05c48fed4c1e1a8811  rsh-redone_85.orig.tar.gz
+# Locally computed
+sha256  92c3a6a0efe5347c282081c6f67aebfec0f33b880c9efb87eb5232dcdd748369  rsh.c
diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
index f37af4384f..fc0136debb 100644
--- a/package/rt-tests/rt-tests.hash
+++ b/package/rt-tests/rt-tests.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 aea85fd8eda8c1d96e9d32a019bfd4a1d2e0d362971d97838996f49d1af2d470  rt-tests-1.0.tar.xz
+sha256  aea85fd8eda8c1d96e9d32a019bfd4a1d2e0d362971d97838996f49d1af2d470  rt-tests-1.0.tar.xz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 9ec2ffee89..88c128aa35 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 cc872aa0991c044d35abfcc81543bad950c6aae487e37d5a09d1cbf8c4cb3058 rtl8188eu-4b0ecca485b9f11f58670b69aa9f90ecad7da02f.tar.gz
+sha256  cc872aa0991c044d35abfcc81543bad950c6aae487e37d5a09d1cbf8c4cb3058  rtl8188eu-4b0ecca485b9f11f58670b69aa9f90ecad7da02f.tar.gz
+sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index ab82f565c0..de84332f72 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 9c8e127dcf2b4d87df546f7f51afdbca0a0561cdba9bcc2689722e1090c46204  rtl8821au-4235b0ec7d7220a6364586d8e25b1e8cb99c36f1.tar.gz
+sha256  9c8e127dcf2b4d87df546f7f51afdbca0a0561cdba9bcc2689722e1090c46204  rtl8821au-4235b0ec7d7220a6364586d8e25b1e8cb99c36f1.tar.gz
+sha256  6d66dec8f6c253a1af2ffd858167c722b1ce3218215446172c81355d0a49e7fc  LICENSE
-- 
2.20.1
