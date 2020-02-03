From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:44:53 +0100
Subject: [Buildroot] [git commit] package/j*: add license file hashes
Message-ID: <20200203133729.BA5608881A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8a3a5a27c1faf33fa2256eef5f6912e714e46a69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/jamvm/jamvm.hash                                 | 1 +
 package/jquery-datetimepicker/jquery-datetimepicker.hash | 3 ++-
 package/jquery-keyboard/jquery-keyboard.hash             | 3 ++-
 package/jquery-sidebar/jquery-sidebar.hash               | 1 +
 package/jquery-ui-themes/jquery-ui-themes.hash           | 1 +
 package/jquery-ui/jquery-ui.hash                         | 1 +
 package/jquery-validation/jquery-validation.hash         | 3 ++-
 package/json-javascript/json-javascript.hash             | 3 ++-
 8 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/package/jamvm/jamvm.hash b/package/jamvm/jamvm.hash
index f8ef76cb92..9bcbd61393 100644
--- a/package/jamvm/jamvm.hash
+++ b/package/jamvm/jamvm.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  76428e96df0ae9dd964c7a7c74c1e9a837e2f312c39e9a357fa8178f7eff80da  jamvm-2.0.0.tar.gz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/jquery-datetimepicker/jquery-datetimepicker.hash b/package/jquery-datetimepicker/jquery-datetimepicker.hash
index b6aba87920..1fbd428e75 100644
--- a/package/jquery-datetimepicker/jquery-datetimepicker.hash
+++ b/package/jquery-datetimepicker/jquery-datetimepicker.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 2f362a8acd149d1487a9460942f135d1037f01ee0cbfecba8c352fa2f79c34c9  jquery-datetimepicker-2.4.5.tar.gz
+sha256  2f362a8acd149d1487a9460942f135d1037f01ee0cbfecba8c352fa2f79c34c9  jquery-datetimepicker-2.4.5.tar.gz
+sha256  491add640b4678b78571d3b4c0840422b48a5b397e47e2104c1942ff1fce1a68  MIT-LICENSE.txt
diff --git a/package/jquery-keyboard/jquery-keyboard.hash b/package/jquery-keyboard/jquery-keyboard.hash
index 171f1133ee..a0d9d7d88c 100644
--- a/package/jquery-keyboard/jquery-keyboard.hash
+++ b/package/jquery-keyboard/jquery-keyboard.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 6a20a1cdc9367c218048125eeb6f78d775175a964b3b9b781a931b63c0f98c66  jquery-keyboard-1.18.12.tar.gz
+sha256  6a20a1cdc9367c218048125eeb6f78d775175a964b3b9b781a931b63c0f98c66  jquery-keyboard-1.18.12.tar.gz
+sha256  0ad9a0e7291b45cdb5abe2a517d8b82282a816d41c9224660849792ce01fe983  README.markdown
diff --git a/package/jquery-sidebar/jquery-sidebar.hash b/package/jquery-sidebar/jquery-sidebar.hash
index 60e44d4187..5d336fee23 100644
--- a/package/jquery-sidebar/jquery-sidebar.hash
+++ b/package/jquery-sidebar/jquery-sidebar.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  c96e46439a87555f2200442f597cce64f21f81f94d7601ddfc3b837913ddb42f  jquery-sidebar-3.3.2.tar.gz
+sha256  f3522370f4b6accf9c1344f520bdea35f2388f1cbb124c0c179d2ca2a6a94c76  LICENSE
diff --git a/package/jquery-ui-themes/jquery-ui-themes.hash b/package/jquery-ui-themes/jquery-ui-themes.hash
index 5441789b99..5f662dad54 100644
--- a/package/jquery-ui-themes/jquery-ui-themes.hash
+++ b/package/jquery-ui-themes/jquery-ui-themes.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  90467a83abcb8d2471b0d53d21b4c09e2cf686d5350e10a6e84fa3f3616a840f  jquery-ui-themes-1.10.4.zip
+sha256  ef1fdd608b20fbea7ef269ed03bd24e637717cc193971798a394bf2fa983cd53  MIT-LICENSE.txt
diff --git a/package/jquery-ui/jquery-ui.hash b/package/jquery-ui/jquery-ui.hash
index daf89d095c..453ecd5521 100644
--- a/package/jquery-ui/jquery-ui.hash
+++ b/package/jquery-ui/jquery-ui.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  c76f349930245360f4d1dea672b9a587f8938b536a378e20eeff919f7263f99f  jquery-ui-1.10.4.zip
+sha256  ef1fdd608b20fbea7ef269ed03bd24e637717cc193971798a394bf2fa983cd53  MIT-LICENSE.txt
diff --git a/package/jquery-validation/jquery-validation.hash b/package/jquery-validation/jquery-validation.hash
index 61c16cf093..af451a6c1a 100644
--- a/package/jquery-validation/jquery-validation.hash
+++ b/package/jquery-validation/jquery-validation.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	14efe6f1784ef6e97116b15c77b04b7e8f47ec07b1479bcd6fa0b081faa19440	jquery-validation-1.14.0.zip
+sha256  14efe6f1784ef6e97116b15c77b04b7e8f47ec07b1479bcd6fa0b081faa19440  jquery-validation-1.14.0.zip
+sha256  c2f9aa180de990ff16ca7e756c9af52ecc1b3536e3fb32649d7b2c510bccf9d0  README.md
diff --git a/package/json-javascript/json-javascript.hash b/package/json-javascript/json-javascript.hash
index 6216445ce0..9522fee9ea 100644
--- a/package/json-javascript/json-javascript.hash
+++ b/package/json-javascript/json-javascript.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1a9dd4429e4bb4929dcb438f9591a3625bc8cc161f840b5f843d8b1d2c8dcfe5  json-javascript-3d7767b6b1f3da363c625ff54e63bbf20e9e83ac.tar.gz
+sha256  1a9dd4429e4bb4929dcb438f9591a3625bc8cc161f840b5f843d8b1d2c8dcfe5  json-javascript-3d7767b6b1f3da363c625ff54e63bbf20e9e83ac.tar.gz
+sha256  925947d3d711c4441a9db20f51215fbf5c119d2a3b51cadb2c9031907d8014b5  json2.js
