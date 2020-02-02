From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:19 +0100
Subject: [Buildroot] [PATCH 29/32] package/xfont*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-30-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 .../xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash      | 1 +
 .../x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash  | 1 +
 .../xfont_font-adobe-utopia-100dpi.hash                       | 1 +
 .../xfont_font-adobe-utopia-75dpi.hash                        | 1 +
 .../xfont_font-adobe-utopia-type1.hash                        | 1 +
 .../x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash  | 1 +
 package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash  | 1 +
 package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash    | 1 +
 .../xfont_font-bh-lucidatypewriter-100dpi.hash                | 1 +
 .../xfont_font-bh-lucidatypewriter-75dpi.hash                 | 1 +
 package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash        | 2 ++
 package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash    | 1 +
 .../xfont_font-bitstream-100dpi.hash                          | 1 +
 .../xfont_font-bitstream-75dpi.hash                           | 1 +
 .../xfont_font-bitstream-type1.hash                           | 1 +
 .../xfont_font-cronyx-cyrillic.hash                           | 1 +
 package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash    | 1 +
 package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash  | 1 +
 package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash  | 1 +
 .../x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash    | 1 +
 .../xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash    | 1 +
 .../xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash    | 1 +
 .../x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash  | 1 +
 package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash  | 1 +
 .../xfont_font-schumacher-misc.hash                           | 1 +
 .../xfont_font-screen-cyrillic.hash                           | 4 +++-
 package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.hash  | 4 +++-
 package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.hash    | 4 +++-
 .../xfont_font-winitzki-cyrillic.hash                         | 4 +++-
 .../xfont_font-xfree86-type1/xfont_font-xfree86-type1.hash    | 4 +++-
 30 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash
index 04809f5dda..514c90915a 100644
--- a/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash
+++ b/package/x11r7/xfont_font-adobe-100dpi/xfont_font-adobe-100dpi.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  b2c08433eab5cb202470aa9f779efefce8d9cab2534f34f3aa4a31d05671c054  font-adobe-100dpi-1.0.3.tar.bz2
+sha256  bf6d862672b4fcc86f3f38bc138ad44e52d52207dd8689b8d3701630fc331194  COPYING
diff --git a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash
index abd48d6bb6..41ac96fc4f 100644
--- a/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash
+++ b/package/x11r7/xfont_font-adobe-75dpi/xfont_font-adobe-75dpi.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  c6024a1e4a1e65f413f994dd08b734efd393ce0a502eb465deb77b9a36db4d09  font-adobe-75dpi-1.0.3.tar.bz2
+sha256  bf6d862672b4fcc86f3f38bc138ad44e52d52207dd8689b8d3701630fc331194  COPYING
diff --git a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.hash b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.hash
index f20f4a7174..81498788be 100644
--- a/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.hash
+++ b/package/x11r7/xfont_font-adobe-utopia-100dpi/xfont_font-adobe-utopia-100dpi.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  d16f5e3f227cc6dd07a160a71f443559682dbc35f1c056a5385085aaec4fada5  font-adobe-utopia-100dpi-1.0.4.tar.bz2
+sha256  234c2a8109afa8034c787dbf69696a9bdd374914aadf937d2a103831d95c1867  COPYING
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash
index 1a60af6196..0b6e1af638 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  8732719c61f3661c8bad63804ebfd54fc7de21ab848e9a26a19b1778ef8b5c94  font-adobe-utopia-75dpi-1.0.4.tar.bz2
+sha256  234c2a8109afa8034c787dbf69696a9bdd374914aadf937d2a103831d95c1867  COPYING
diff --git a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.hash b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.hash
index 4da2a4ff8c..514dd2829f 100644
--- a/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.hash
+++ b/package/x11r7/xfont_font-adobe-utopia-type1/xfont_font-adobe-utopia-type1.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  979435105f897a70f8993fa02c8362160b0513366c2ab896965416f96dbb8077  font-adobe-utopia-type1-1.0.4.tar.bz2
+sha256  234c2a8109afa8034c787dbf69696a9bdd374914aadf937d2a103831d95c1867  COPYING
diff --git a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash
index 03950039d8..3c565450f4 100644
--- a/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash
+++ b/package/x11r7/xfont_font-arabic-misc/xfont_font-arabic-misc.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  505d9b12a7093389e67a925dfda6346bde26d114c67f0cdca7aeda6e5d3344f4  font-arabic-misc-1.0.3.tar.bz2
+sha256  192b677a887c20f9671cc357cd5ea7bae586003d61c1f8f6e164e8f5530abf57  COPYING
diff --git a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash
index 3a9d4c78b1..154d6eb2fd 100644
--- a/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash
+++ b/package/x11r7/xfont_font-bh-100dpi/xfont_font-bh-100dpi.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  23c07162708e4b79eb33095c8bfa62c783717a9431254bbf44863734ea239481  font-bh-100dpi-1.0.3.tar.bz2
+sha256  888fd79d2c7e6332559d661c62f7a50f92fc5842e6ff0e0bd4c59b0083dabce9  COPYING
diff --git a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash
index ee24538e6e..0648e26dd9 100644
--- a/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash
+++ b/package/x11r7/xfont_font-bh-75dpi/xfont_font-bh-75dpi.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  3486aa51ac92c646a448fe899c5c3dae0024b1fef724d5100d52640d1cac721c  font-bh-75dpi-1.0.3.tar.bz2
+sha256  888fd79d2c7e6332559d661c62f7a50f92fc5842e6ff0e0bd4c59b0083dabce9  COPYING
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.hash b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.hash
index 6e9c7e3c78..439d5d2602 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.hash
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-100dpi/xfont_font-bh-lucidatypewriter-100dpi.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  62a83363c2536095fda49d260d21e0847675676e4e3415054064cbdffa641fbb  font-bh-lucidatypewriter-100dpi-1.0.3.tar.bz2
+sha256  9428a98add4fada4c98e031ae0f29d27f8b15a2c8c6e8830591a4c18ea26a6cd  COPYING
diff --git a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.hash b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.hash
index 374b8f6f01..ed8d8514db 100644
--- a/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.hash
+++ b/package/x11r7/xfont_font-bh-lucidatypewriter-75dpi/xfont_font-bh-lucidatypewriter-75dpi.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  4ac16afbe205480cc5572e2977ea63488c543d05be0ea8e5a94c845a6eebcb31  font-bh-lucidatypewriter-75dpi-1.0.3.tar.bz2
+sha256  9428a98add4fada4c98e031ae0f29d27f8b15a2c8c6e8830591a4c18ea26a6cd  COPYING
diff --git a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash
index 8df8e4b937..05063726ba 100644
--- a/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash
+++ b/package/x11r7/xfont_font-bh-ttf/xfont_font-bh-ttf.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2010-November/001537.html
 sha1	f42ebd527096011040a312e0f9cdf78d64177419	font-bh-ttf-1.0.3.tar.bz2
+# Locally computed
+sha256  27d47d50006773f1c0bd97661252ae27bb8cfd6951f253bd9d3ef81ed1243934  COPYING
diff --git a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash
index 89303dbc91..cb0387d9e9 100644
--- a/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash
+++ b/package/x11r7/xfont_font-bh-type1/xfont_font-bh-type1.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  761455a297486f3927a85d919b5c948d1d324181d4bea6c95d542504b68a63c1  font-bh-type1-1.0.3.tar.bz2
+sha256  27d47d50006773f1c0bd97661252ae27bb8cfd6951f253bd9d3ef81ed1243934  COPYING
diff --git a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.hash b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.hash
index 09186ae57a..1cef17d4cd 100644
--- a/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.hash
+++ b/package/x11r7/xfont_font-bitstream-100dpi/xfont_font-bitstream-100dpi.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  ebe0d7444e3d7c8da7642055ac2206f0190ee060700d99cd876f8fc9964cb6ce  font-bitstream-100dpi-1.0.3.tar.bz2
+sha256  6faf32f092c2b92f3f99e0d63db9d802b11b4dd5aa0ce991f107a398d7f1ae80  COPYING
diff --git a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.hash b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.hash
index 7ec889406b..9973f1f456 100644
--- a/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.hash
+++ b/package/x11r7/xfont_font-bitstream-75dpi/xfont_font-bitstream-75dpi.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  ba3f5e4610c07bd5859881660753ec6d75d179f26fc967aa776dbb3d5d5cf48e  font-bitstream-75dpi-1.0.3.tar.bz2
+sha256  6faf32f092c2b92f3f99e0d63db9d802b11b4dd5aa0ce991f107a398d7f1ae80  COPYING
diff --git a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.hash b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.hash
index 7e958b349e..81bb8fc791 100644
--- a/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.hash
+++ b/package/x11r7/xfont_font-bitstream-type1/xfont_font-bitstream-type1.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  c6ea0569adad2c577f140328dc3302e729cb1b1ea90cd0025caf380625f8a688  font-bitstream-type1-1.0.3.tar.bz2
+sha256  ecad5afdbd1308634896744a4c962361e9eca73e7d9969bb3aad94533c66d046  COPYING
diff --git a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.hash b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.hash
index 7fc295fdc2..893ba5718d 100644
--- a/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.hash
+++ b/package/x11r7/xfont_font-cronyx-cyrillic/xfont_font-cronyx-cyrillic.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  6e8631936157677c77ba032b5c7b1fb3cb2ee872dbcea0444f12cd602cd9212a  font-cronyx-cyrillic-1.0.3.tar.bz2
+sha256  857fa9f8d12bd7ce7fb235393d775dd5e0b5130fac7a88fdea9156d75b609402  COPYING
diff --git a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash
index 50c6136bf5..34873fe3b7 100644
--- a/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash
+++ b/package/x11r7/xfont_font-dec-misc/xfont_font-dec-misc.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  e19ddf8b5f8de914d81675358fdfe37762e9ce524887cc983adef34f2850ff7b  font-dec-misc-1.0.3.tar.bz2
+sha256  bf4d44be4b5eb66c53bf5f7eb2d9d4817fb937788b37ed6ceda1876fdb964817  COPYING
diff --git a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash
index 11aa890877..c5e8f4e4ae 100644
--- a/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash
+++ b/package/x11r7/xfont_font-ibm-type1/xfont_font-ibm-type1.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  fddb28d3db5a07f4b4ca15388488a9680a10e1367a18f358f903b2a608a5d2df  font-ibm-type1-1.0.3.tar.bz2
+sha256  fc0fd4df7ac7ac7f9b1ff3a221f28c52edea4506dc4c84f1869a3f4281360ca1  COPYING
diff --git a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash
index 35324d4350..bc4a9e5b17 100644
--- a/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash
+++ b/package/x11r7/xfont_font-isas-misc/xfont_font-isas-misc.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  5824ab4b485951107dd245b8f7717d2822f1a6dbf6cea98f1ac7f49905c0a867  font-isas-misc-1.0.3.tar.bz2
+sha256  32d5d082b8186051bbe75ea9cbedc646830217ca931b1b7a1e534a828c94e839  COPYING
diff --git a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash
index 223ca0f86f..ce0899b65a 100644
--- a/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash
+++ b/package/x11r7/xfont_font-micro-misc/xfont_font-micro-misc.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  9a3381c10f32d9511f0ad4179df395914c50779103c16cddf7017f5220ed8db6  font-micro-misc-1.0.3.tar.bz2
+sha256  1711d038bca0efb51b5114e902412019d1c21531882866b1a6908c6386268cfb  COPYING
diff --git a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash
index 1627112282..5eb407f4c7 100644
--- a/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash
+++ b/package/x11r7/xfont_font-misc-cyrillic/xfont_font-misc-cyrillic.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  e40fe3e3323c62b738550795457ad555c70c008aa91b5912dfd46f8e745f5e60  font-misc-cyrillic-1.0.3.tar.bz2
+sha256  8765722448e0ca6ce113d0406554c40224f74abfc005f4b2ef927567349f1529  COPYING
diff --git a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash
index c75816a856..f806bf0898 100644
--- a/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash
+++ b/package/x11r7/xfont_font-misc-ethiopic/xfont_font-misc-ethiopic.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  53cb1fd83afdbe7939c0eac34003676ee0e6023216892d98054db90b703c98a5  font-misc-ethiopic-1.0.3.tar.bz2
+sha256  94835f274f1ddad34f8fd3a06b2c493222a68e4094f4097000d101f22ee0d0d5  COPYING
diff --git a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash
index 7a7ca92ea5..92046c8511 100644
--- a/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash
+++ b/package/x11r7/xfont_font-misc-meltho/xfont_font-misc-meltho.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  3721323f13855cf7ca609115a1f7b182491e9b2b9c6e01eb1a2c7f8edd480791  font-misc-meltho-1.0.3.tar.bz2
+sha256  6a02b45e4877b9df8c1bdaa21e1e8fba86d85e3be4c90f2791183a501e0cbd25  COPYING
diff --git a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash
index 45a6fc1be9..f6e8e9aa79 100644
--- a/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash
+++ b/package/x11r7/xfont_font-mutt-misc/xfont_font-mutt-misc.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  bd5f7adb34367c197773a9801df5bce7b019664941900b2a31fbfe1ff2830f8f  font-mutt-misc-1.0.3.tar.bz2
+sha256  81d42a6eeaf3ac2fcc1e1408fb6e2039d1162ca85d4abaf75e3daddcb250e4ff  COPYING
diff --git a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.hash b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.hash
index 6da0963d47..107493b267 100644
--- a/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.hash
+++ b/package/x11r7/xfont_font-schumacher-misc/xfont_font-schumacher-misc.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  e444028656e0767e2eddc6d9aca462b16a2be75a47244dbc199b2c44eca87e5a  font-schumacher-misc-1.1.2.tar.bz2
+sha256  4e2b9933887950acad3a780dce91c71770c8887f132bcd0c2ba6146cdc372407  COPYING
diff --git a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.hash b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.hash
index 0de78d8974..e8d3fa1605 100644
--- a/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.hash
+++ b/package/x11r7/xfont_font-screen-cyrillic/xfont_font-screen-cyrillic.hash
@@ -1,2 +1,4 @@
 # From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256 824231e8dffe15299454e47259f29d98001c9cf8ad3d6b5171399e4d71705e79  font-screen-cyrillic-1.0.4.tar.bz2
+sha256  824231e8dffe15299454e47259f29d98001c9cf8ad3d6b5171399e4d71705e79  font-screen-cyrillic-1.0.4.tar.bz2
+# Locally computed
+sha256  5234cbcbdcc9865ce2b576b5f67e77e40ccdc1aa01e6528bea5a17784934b894  COPYING
diff --git a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.hash b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.hash
index aef4b6fe47..80261ff312 100644
--- a/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.hash
+++ b/package/x11r7/xfont_font-sony-misc/xfont_font-sony-misc.hash
@@ -1,2 +1,4 @@
 # From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256 2043a326ba347c9da5ca1e9bc363e2521c3ea40b43b1f9662d333efd4867cff5 font-sony-misc-1.0.3.tar.bz2
+sha256  2043a326ba347c9da5ca1e9bc363e2521c3ea40b43b1f9662d333efd4867cff5  font-sony-misc-1.0.3.tar.bz2
+# Locally computed
+sha256  8233ff7d7bc8b5b46cbba3f6cd0069d2ef875bd1b1e0090ca4145282aa096739  COPYING
diff --git a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.hash b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.hash
index 9d3697814d..8b195c9f9b 100644
--- a/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.hash
+++ b/package/x11r7/xfont_font-sun-misc/xfont_font-sun-misc.hash
@@ -1,2 +1,4 @@
 # From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256 481f4fcbbf7005658b080b3cf342c8c76de752e77f47958b2b383de73266d2e0 font-sun-misc-1.0.3.tar.bz2
+sha256  481f4fcbbf7005658b080b3cf342c8c76de752e77f47958b2b383de73266d2e0  font-sun-misc-1.0.3.tar.bz2
+# Locally computed
+sha256  dd6da1d39832ab2878c3304405c1c7883c6da292ffde262fca1785239534c40f  COPYING
diff --git a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.hash b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.hash
index 89fbda9acf..283f6f9f2c 100644
--- a/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.hash
+++ b/package/x11r7/xfont_font-winitzki-cyrillic/xfont_font-winitzki-cyrillic.hash
@@ -1,2 +1,4 @@
 # From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256 abd13b63d02fcaec488686c23683e5cf640b43bd32f8ca22eeae6f84df0a36a0 font-winitzki-cyrillic-1.0.3.tar.bz2
+sha256  abd13b63d02fcaec488686c23683e5cf640b43bd32f8ca22eeae6f84df0a36a0  font-winitzki-cyrillic-1.0.3.tar.bz2
+# Locally computed
+sha256  ca60a2aa1133e39e8c72a01af06cf0c927f5ddfe70d469d1535231100618095d  COPYING
diff --git a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.hash b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.hash
index 38be53bf52..640f56636a 100644
--- a/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.hash
+++ b/package/x11r7/xfont_font-xfree86-type1/xfont_font-xfree86-type1.hash
@@ -1,2 +1,4 @@
 # From http://www.x.org/archive/current/src/everything/CHECKSUMS
-sha256 caebf42aec7be7f3bd40e0f232d6f34881b853dc84acfcdf7458358701fbe34a font-xfree86-type1-1.0.4.tar.bz2
+sha256  caebf42aec7be7f3bd40e0f232d6f34881b853dc84acfcdf7458358701fbe34a  font-xfree86-type1-1.0.4.tar.bz2
+# Locally computed
+sha256  51e6bc6513b3fa94512d8dd570240498c878605f25292c3883d92fdfca18d0c6  COPYING
-- 
2.20.1
