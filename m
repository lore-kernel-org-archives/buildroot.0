From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:45:37 +0100
Subject: [Buildroot] [git commit] package/xdriver*: add license file hashes
Message-ID: <20200203133730.BCF468881A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f294824880f5e71f5b288d3f8451e6321670f55f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash      | 4 +++-
 .../xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash      | 4 +++-
 .../x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash  | 4 +++-
 package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash      | 4 +++-
 package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash      | 4 +++-
 .../x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.hash    | 4 +++-
 package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash  | 2 ++
 package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash  | 2 ++
 .../x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.hash  | 1 +
 package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash  | 4 +++-
 package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash  | 4 +++-
 .../x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash  | 2 ++
 package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash        | 4 +++-
 package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash      | 4 +++-
 .../x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash    | 4 +++-
 .../xdriver_xf86-video-siliconmotion.hash                             | 2 ++
 package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.hash      | 4 +++-
 .../x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash  | 2 ++
 18 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash
index feec2d3777..d2384d6c15 100644
--- a/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash
+++ b/package/x11r7/xdriver_xf86-input-joystick/xdriver_xf86-input-joystick.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2016-November/002742.html
-sha256 9e7669ecf0f23b8e5dc39d5397cf28296f692aa4c0e4255f5e02816612c18eab  xf86-input-joystick-1.6.3.tar.bz2
+sha256  9e7669ecf0f23b8e5dc39d5397cf28296f692aa4c0e4255f5e02816612c18eab  xf86-input-joystick-1.6.3.tar.bz2
+# Locally calculated
+sha256  460cf612147407317a3911ce03a215707d8d6d5f3e604a53fefa6e54974ad07e  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
index eccfa74dc8..66e2c3ed95 100644
--- a/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
+++ b/package/x11r7/xdriver_xf86-input-keyboard/xdriver_xf86-input-keyboard.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2016-November/002739.html
-sha256 f7c900f21752683402992b288d5a2826de7a6c0c0abac2aadd7e8a409e170388  xf86-input-keyboard-1.9.0.tar.bz2
+sha256  f7c900f21752683402992b288d5a2826de7a6c0c0abac2aadd7e8a409e170388  xf86-input-keyboard-1.9.0.tar.bz2
+# Locally calculated
+sha256  b91b17c53724c79685e3025a38028b7d48c966fdd239e0efe2d98874d3c139a0  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
index 302b1cd450..fd6221fa23 100644
--- a/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
+++ b/package/x11r7/xdriver_xf86-input-vmmouse/xdriver_xf86-input-vmmouse.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-June/002616.html
-sha256	0af558957ac1be1b2863712c2475de8f4d7f14921fd01ded2e2fde4921b19319	xf86-input-vmmouse-13.1.0.tar.bz2
+sha256  0af558957ac1be1b2863712c2475de8f4d7f14921fd01ded2e2fde4921b19319  xf86-input-vmmouse-13.1.0.tar.bz2
+# Locally calculated
+sha256  804737a1582428fdde4e2bfd1e9f3ca07971fc3bdce20ba2d06cc2bba6c84a9e  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash
index 30953ef7fb..2e2e953676 100644
--- a/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash
+++ b/package/x11r7/xdriver_xf86-video-ark/xdriver_xf86-video-ark.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2012-July/002007.html
-sha256	c690e046f34a393aac1c8d9616b4790e93cda60a460b00b9597d322175dbe51e	xf86-video-ark-0.7.5.tar.bz2
+sha256  c690e046f34a393aac1c8d9616b4790e93cda60a460b00b9597d322175dbe51e  xf86-video-ark-0.7.5.tar.bz2
+# Locally calculated
+sha256  8ba9850fb0ecd9033bb1d25c1be85625cb53ca56ce76b71f78f4a034f7310bda  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
index cf877d5b3f..2988db98af 100644
--- a/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
+++ b/package/x11r7/xdriver_xf86-video-ast/xdriver_xf86-video-ast.hash
@@ -1,2 +1,4 @@
 # Locally computed
-sha256	1edbbc55d47d3fd71dec99b15c2483e22738c642623a0fb86ef4a81a9067a2de	xf86-video-ast-1.1.5.tar.bz2
+sha256  1edbbc55d47d3fd71dec99b15c2483e22738c642623a0fb86ef4a81a9067a2de  xf86-video-ast-1.1.5.tar.bz2
+# Locally calculated
+sha256  1cdd3d57e2fdcbd21b8a7b788ffbe6f809216a9bdd36b2225cff6c4b4404a170  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.hash b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.hash
index 86ef09e210..0600bce16e 100644
--- a/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.hash
+++ b/package/x11r7/xdriver_xf86-video-cirrus/xdriver_xf86-video-cirrus.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-May/002600.html
-sha256	edc87b20a55259126b5239b5c1ef913419eab7ded0ed12ae9ae989460d7351ab	xf86-video-cirrus-1.5.3.tar.bz2
+sha256  edc87b20a55259126b5239b5c1ef913419eab7ded0ed12ae9ae989460d7351ab  xf86-video-cirrus-1.5.3.tar.bz2
+# Locally calculated
+sha256  a113cf02dcfa523593727790a17172080ac87d8de16e766bda4cbbe73dd8dc62  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
index f26ddd4b5f..3eac3840ef 100644
--- a/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
+++ b/package/x11r7/xdriver_xf86-video-dummy/xdriver_xf86-video-dummy.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2016-December/002751.html
 sha256 3712bb869307233491e4c570732d6073c0dc3d99adfdb9977396a3fdf84e95b9  xf86-video-dummy-0.3.8.tar.bz2
+# Locally calculated
+sha256 e29aa81e74563d14e5633963107c030e74e8352ea7dafee1a9d7e19b7d0e887b  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
index d0cbc09038..dd3a9c3895 100644
--- a/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
+++ b/package/x11r7/xdriver_xf86-video-fbdev/xdriver_xf86-video-fbdev.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2013-September/002324.html
 sha256	dcc3d85f378022180e437a9ec00a59b6cb7680ff79c40394d695060af2374699	xf86-video-fbdev-0.5.0.tar.bz2
+# Locally calculated
+sha256  e437aed89c3440a9fe7e19968a3f2eeb97041ef6c9616837a3fd42d0874fc0e6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.hash b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.hash
index 0370216283..4b3cf8dd2d 100644
--- a/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.hash
+++ b/package/x11r7/xdriver_xf86-video-fbturbo/xdriver_xf86-video-fbturbo.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  10411686de0a9d8b2cde300b0d68e9f1d22e3611470d357ef3afc337f123ca0f  xdriver_xf86-video-fbturbo-0.4.0.tar.gz
+sha256  8333e3fa5b0f8d8aceca2f060d4eceeb6033cefed2301b03c3e92f6e3ebbffce  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
index 8c567cbb3d..07e4abf801 100644
--- a/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
+++ b/package/x11r7/xdriver_xf86-video-geode/xdriver_xf86-video-geode.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2016-December/002750.html
-sha256 c6694c21ee3d9560f6e925925ef1d3818b1988e899b6a0592dbae597c87ac97e  xf86-video-geode-2.11.19.tar.bz2
+sha256  c6694c21ee3d9560f6e925925ef1d3818b1988e899b6a0592dbae597c87ac97e  xf86-video-geode-2.11.19.tar.bz2
+# Locally calculated
+sha256  3994ef7cee54f0935a4b57b1c34efd904da567931dd9e1a2d9390d22c8332ea2  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash
index f4e42bf4c6..40474ebc7b 100644
--- a/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash
+++ b/package/x11r7/xdriver_xf86-video-glint/xdriver_xf86-video-glint.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2017-January/002759.html
-sha256 852833ab2ea9ce519195dfd061a6c7aa5945a093cdc19546d1e9e69df7d577d2  xf86-video-glint-1.2.9.tar.bz2
+sha256  852833ab2ea9ce519195dfd061a6c7aa5945a093cdc19546d1e9e69df7d577d2  xf86-video-glint-1.2.9.tar.bz2
+# Locally calculated
+sha256  6ca8e1a7e1d491f3618d3f14df1be64dbc8adefae7bbaf11d4920240dfb12f6e  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
index be41cb091b..e5d46c86f3 100644
--- a/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
+++ b/package/x11r7/xdriver_xf86-video-imx-viv/xdriver_xf86-video-imx-viv.hash
@@ -1 +1,3 @@
+# Locally calculated
 sha256	61b3a7a22f80d1cbc797c329615e1699f3906c9261de7eabcf0de2bf2399de55  xdriver_xf86-video-imx-viv-rel_imx_4.9.x_1.0.0_ga.tar.gz
+sha256  9d3e373f0440cc0c58853e963636a7c1ffda9308ec5f30ebe9adfb9c16a8a1e4  COPYING-MIT
diff --git a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
index fe91307a62..e1835687aa 100644
--- a/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
+++ b/package/x11r7/xdriver_xf86-video-nv/xdriver_xf86-video-nv.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2017-January/002761.html
-sha256 1f98649e6ff0e8214b9d5dcac661f1d004be8e73823d8247b9c7025fd81db32d  xf86-video-nv-2.1.21.tar.bz2
+sha256  1f98649e6ff0e8214b9d5dcac661f1d004be8e73823d8247b9c7025fd81db32d  xf86-video-nv-2.1.21.tar.bz2
+# Locally calculated
+sha256  10d10e1ec37594d481c3de8dda22a40b731ebd43be7ccd462baaa7394738a9f3  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
index 7a09821084..fdf0cc434d 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2016-December/002753.html
-sha256 b18682e04503c6326f7bf7190f3ee50a3d4d69758a2a3cc9af102a6b3f114c92  xf86-video-qxl-0.1.5.tar.bz2
+sha256  b18682e04503c6326f7bf7190f3ee50a3d4d69758a2a3cc9af102a6b3f114c92  xf86-video-qxl-0.1.5.tar.bz2
+# Locally calculated
+sha256  83f3bf7be3fbf5e66174b8184bd837a6b44264f8e340126ea4d9e9ce956a1866  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
index 4f155359a1..661c8749f2 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2017-January/002760.html
-sha256 2c93c4db1f71e725dda0caee5821253129d4b52d7aa0fd720593e7769bceec86  xf86-video-savage-2.3.9.tar.bz2
+sha256  2c93c4db1f71e725dda0caee5821253129d4b52d7aa0fd720593e7769bceec86  xf86-video-savage-2.3.9.tar.bz2
+# Locally calculated
+sha256  611f4020815e3d5011a39a58f0958262715cd3becd9cb1ef14cc166fd84ec5a6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
index 819698c611..dc9a350360 100644
--- a/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
+++ b/package/x11r7/xdriver_xf86-video-siliconmotion/xdriver_xf86-video-siliconmotion.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2017-January/002763.html
 sha256 d0f3c691e71108d27a061beb62bf78b36ec35bd755905692734dd68cfb3359bc  xf86-video-siliconmotion-1.7.9.tar.bz2
+# Locally calculated
+sha256 e1e3ce7ce1f63fff96444206e09c8490ad7a4af7457c81ea6cdee4f1fee1f960  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.hash b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.hash
index a32fdc75a9..4f8c10965c 100644
--- a/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.hash
+++ b/package/x11r7/xdriver_xf86-video-tga/xdriver_xf86-video-tga.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2012-July/002025.html
-sha256	2023818000200eb50a59476e36d59b07a361b110e73b1d9cc526beb669306131	xf86-video-tga-1.2.2.tar.bz2
+sha256  2023818000200eb50a59476e36d59b07a361b110e73b1d9cc526beb669306131  xf86-video-tga-1.2.2.tar.bz2
+# Locally calculated
+sha256  92e36c6b7c99c8335e5823d53686e58ebd82ee8051a6360f60c8c0fb05745954  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
index 04a559ac5d..8f47bac204 100644
--- a/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
+++ b/package/x11r7/xdriver_xf86-video-trident/xdriver_xf86-video-trident.hash
@@ -1,2 +1,4 @@
 # From https://lists.x.org/archives/xorg-announce/2017-January/002762.html
 sha256 9e5119d974c3e2221994542d35e3a0b3426a441869ddd6dd08a84f324856ac3f  xf86-video-trident-1.3.8.tar.bz2
+# Locally calculated
+sha256 4f065198c49eac1513b915bc4478152c21119f31a97919a6ea8f3e1d10133d15  COPYING
