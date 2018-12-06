From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  6 Dec 2018 05:34:01 +0100
Subject: [Buildroot] [PATCH v2 4/5] lua*: regeneration of hash files
In-Reply-To: <20181206043402.31755-1-francois.perrad@gadz.org>
References: <20181206043402.31755-1-francois.perrad@gadz.org>
Message-ID: <20181206043402.31755-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/argparse/argparse.hash                     | 5 +++--
 package/cgilua/cgilua.hash                         | 3 ++-
 package/copas/copas.hash                           | 3 ++-
 package/coxpcall/coxpcall.hash                     | 3 ++-
 package/dado/dado.hash                             | 3 ++-
 package/ljlinenoise/ljlinenoise.hash               | 5 +++--
 package/lpeg/lpeg.hash                             | 4 ++--
 package/lpty/lpty.hash                             | 5 +++--
 package/lrandom/lrandom.hash                       | 6 +++---
 package/lsqlite3/lsqlite3.hash                     | 4 ++--
 package/lua-basexx/lua-basexx.hash                 | 3 ++-
 package/lua-bit32/lua-bit32.hash                   | 5 +++--
 package/lua-cjson/lua-cjson.hash                   | 5 +++--
 package/lua-coat/lua-coat.hash                     | 5 +++--
 package/lua-coatpersistent/lua-coatpersistent.hash | 7 ++++---
 package/lua-compat53/lua-compat53.hash             | 3 ++-
 package/lua-csnappy/lua-csnappy.hash               | 5 +++--
 package/lua-curl/lua-curl.hash                     | 3 ++-
 package/lua-datafile/lua-datafile.hash             | 3 ++-
 package/lua-fifo/lua-fifo.hash                     | 3 ++-
 package/lua-flu/lua-flu.hash                       | 5 +++--
 package/lua-http/lua-http.hash                     | 3 ++-
 package/lua-iconv/lua-iconv.hash                   | 5 +++--
 package/lua-lpeg-patterns/lua-lpeg-patterns.hash   | 3 ++-
 package/lua-markdown/lua-markdown.hash             | 3 ++-
 package/lua-messagepack/lua-messagepack.hash       | 3 ++-
 package/lua-periphery/lua-periphery.hash           | 5 +++--
 package/lua-resty-http/lua-resty-http.hash         | 3 ++-
 package/lua-sailor/lua-sailor.hash                 | 3 ++-
 package/lua-stdlib/lua-stdlib.hash                 | 3 ++-
 package/lua-testmore/lua-testmore.hash             | 5 +++--
 package/lua-utf8/lua-utf8.hash                     | 2 +-
 package/lua-valua/lua-valua.hash                   | 3 ++-
 package/luabitop/luabitop.hash                     | 4 ++--
 package/luacrypto/luacrypto.hash                   | 5 +++--
 package/luadbi-sqlite3/luadbi-sqlite3.hash         | 3 ++-
 package/luadbi/luadbi.hash                         | 3 ++-
 package/luaexpat/luaexpat.hash                     | 5 +++--
 package/luafilesystem/luafilesystem.hash           | 3 ++-
 package/luajson/luajson.hash                       | 3 ++-
 package/lualogging/lualogging.hash                 | 5 +++--
 package/luaossl/luaossl.hash                       | 3 ++-
 package/luasec/luasec.hash                         | 5 +++--
 package/luasocket/luasocket.hash                   | 5 +++--
 package/luasql-sqlite3/luasql-sqlite3.hash         | 5 +++--
 package/lunit/lunit.hash                           | 5 +++--
 package/orbit/orbit.hash                           | 4 +++-
 package/rings/rings.hash                           | 5 +++--
 package/wsapi-fcgi/wsapi-fcgi.hash                 | 4 +++-
 package/wsapi-xavante/wsapi-xavante.hash           | 4 +++-
 package/wsapi/wsapi.hash                           | 6 ++++--
 package/xavante/xavante.hash                       | 3 ++-
 52 files changed, 130 insertions(+), 79 deletions(-)

diff --git a/package/argparse/argparse.hash b/package/argparse/argparse.hash
index a4746bc6a..fa72c6cae 100644
--- a/package/argparse/argparse.hash
+++ b/package/argparse/argparse.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	e00e5637c937d7bfca96025f2c598ba4fffe9eb818d69952e77b4c08167a6be3  argparse-0.5.0-1.src.rock
+# computed by luarocks/buildroot
+sha256 e00e5637c937d7bfca96025f2c598ba4fffe9eb818d69952e77b4c08167a6be3  argparse-0.5.0-1.src.rock
+sha256 88ecefab74d7b1bd603d6ab20760e0ac61015af1b00405ffca6fa649b9f8aeef  argparse/LICENSE
diff --git a/package/cgilua/cgilua.hash b/package/cgilua/cgilua.hash
index b932e80cb..8bdb1d18f 100644
--- a/package/cgilua/cgilua.hash
+++ b/package/cgilua/cgilua.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 7d4883e6a89b3463a1d35b8084a6e2afbbb584af7aca1169380e92af0f848413  cgilua-5.2.1-1.src.rock
+sha256 0cf6f0858b0fd90bb5705c8ace77a8afd11e8fce1427fe0a48156937222b8c28  cgilua-5.2.1/doc/us/license.html
diff --git a/package/copas/copas.hash b/package/copas/copas.hash
index d894b8657..4e9e78784 100644
--- a/package/copas/copas.hash
+++ b/package/copas/copas.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 efeded4f4633bc71551175b239199304640ef918ae8ea9dc9c5047359ae07107  copas-2.0.2-1.src.rock
+sha256 3f59cccf38e9397f6fb34dcff983a24d336df982edb5b0cde549d0c32c28c9c0  copas-2_0_2/LICENSE
diff --git a/package/coxpcall/coxpcall.hash b/package/coxpcall/coxpcall.hash
index e037af9e8..0ea60e139 100644
--- a/package/coxpcall/coxpcall.hash
+++ b/package/coxpcall/coxpcall.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 c1488ee08e5d25d59a11e19cb0322edae509202b246d0c93cb2de1676dbfdf2b  coxpcall-1.16.0-1.src.rock
+sha256 11f0f03dda1a28eca658d5e3361c15fd4d048371364aacc5f6870d77a66866c8  coxpcall/doc/license.html
diff --git a/package/dado/dado.hash b/package/dado/dado.hash
index 973bdb3ff..a57f52b88 100644
--- a/package/dado/dado.hash
+++ b/package/dado/dado.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 5a10ed7ff7be34ac004d10d6ea62ee8efc2b594c50ffc93e840e7fb7a2e6b4d0  dado-1.8.3-1.src.rock
+sha256 141953aa7714e3145a6adfd71d6acbbe377e07ab920bc8ec4039394774da8a6e  dado-1.8.3/doc/license.html
diff --git a/package/ljlinenoise/ljlinenoise.hash b/package/ljlinenoise/ljlinenoise.hash
index c70b5d680..647f11d86 100644
--- a/package/ljlinenoise/ljlinenoise.hash
+++ b/package/ljlinenoise/ljlinenoise.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	7a6c4142b0096106f498d7ee4bea5bf5086c076d1f071893441b8e5c0665fb47  ljlinenoise-0.1.3-1.src.rock
+# computed by luarocks/buildroot
+sha256 7a6c4142b0096106f498d7ee4bea5bf5086c076d1f071893441b8e5c0665fb47  ljlinenoise-0.1.3-1.src.rock
+sha256 9b17730cb34ea591fb39688e70bd2be9c13d11b9db1c813b4ae68e3da9b7093e  ljlinenoise-0.1.3/COPYRIGHT
diff --git a/package/lpeg/lpeg.hash b/package/lpeg/lpeg.hash
index 926167486..da38cc875 100644
--- a/package/lpeg/lpeg.hash
+++ b/package/lpeg/lpeg.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	149be31e0155c4694f77ea7264d9b398dd134eca0d00ff03358d91a6cfb2ea9d  lpeg-1.0.1-1.src.rock
+# computed by luarocks/buildroot
+sha256 149be31e0155c4694f77ea7264d9b398dd134eca0d00ff03358d91a6cfb2ea9d  lpeg-1.0.1-1.src.rock
diff --git a/package/lpty/lpty.hash b/package/lpty/lpty.hash
index a451fd858..6b21d75a5 100644
--- a/package/lpty/lpty.hash
+++ b/package/lpty/lpty.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	cf263ece9b50a78a7fb2277e3546fbbf0bf6858f41821932d92f2e3d8a065091  lpty-1.0.1-1.src.rock
+# computed by luarocks/buildroot
+sha256 cf263ece9b50a78a7fb2277e3546fbbf0bf6858f41821932d92f2e3d8a065091  lpty-1.0.1-1.src.rock
+sha256 c5a128a73cad5f6e111ebd8f4a9fa3500562c57912972eb15627db9610d43dec  lpty-1.0.1-1/doc/LICENSE
diff --git a/package/lrandom/lrandom.hash b/package/lrandom/lrandom.hash
index 3f601330c..ce59268bb 100644
--- a/package/lrandom/lrandom.hash
+++ b/package/lrandom/lrandom.hash
@@ -1,3 +1,3 @@
-# Locally calculated
-sha256	96fbc56beb0efca20253301915e14ba25150e2b09541ea7a3570e0def624b196  lrandom-20120430.51-1.src.rock
-sha256	480a6cf11caaba99290ff30cd6e854ac9dce61e38b9d9caf5498165f7fb93454  lrandom-20120430.52-1.src.rock
+# computed by luarocks/buildroot
+sha256 96fbc56beb0efca20253301915e14ba25150e2b09541ea7a3570e0def624b196  lrandom-20120430.51-1.src.rock
+sha256 480a6cf11caaba99290ff30cd6e854ac9dce61e38b9d9caf5498165f7fb93454  lrandom-20120430.52-1.src.rock
diff --git a/package/lsqlite3/lsqlite3.hash b/package/lsqlite3/lsqlite3.hash
index 7cf0358d1..3bff0c8d1 100644
--- a/package/lsqlite3/lsqlite3.hash
+++ b/package/lsqlite3/lsqlite3.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	e6eb64a7ca3727c3093f3c37341d8ecadf9eac913e468eae413828476b19c225  lsqlite3-0.9.4-2.src.rock
+# computed by luarocks/buildroot
+sha256 e6eb64a7ca3727c3093f3c37341d8ecadf9eac913e468eae413828476b19c225  lsqlite3-0.9.4-2.src.rock
diff --git a/package/lua-basexx/lua-basexx.hash b/package/lua-basexx/lua-basexx.hash
index 91c428c14..aee636c32 100644
--- a/package/lua-basexx/lua-basexx.hash
+++ b/package/lua-basexx/lua-basexx.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 ff5379b1f5b396103b8bb589ab3dd94d0a727c8e7a48dcfe1c73e2f07af6a8df  basexx-0.4.0-1.src.rock
+sha256 a1826a43c9e04f9e9b2e5d26d636c656812483bcd513618eec9d72cee69d446b  basexx-0.4.0/LICENSE
diff --git a/package/lua-bit32/lua-bit32.hash b/package/lua-bit32/lua-bit32.hash
index 21dbd0531..22d5b01be 100644
--- a/package/lua-bit32/lua-bit32.hash
+++ b/package/lua-bit32/lua-bit32.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256  fe7bc70d1e48183d95ccfb6741e70a676283075173122cb161303d77059b27a6  bit32-5.3.0-1.src.rock
+# computed by luarocks/buildroot
+sha256 fe7bc70d1e48183d95ccfb6741e70a676283075173122cb161303d77059b27a6  bit32-5.3.0-1.src.rock
+sha256 0443ddabab14f69d4c5e2641860343784a0ccbe5ae7a3743f20de9a13991da66  lua-compat-5.2/LICENSE
diff --git a/package/lua-cjson/lua-cjson.hash b/package/lua-cjson/lua-cjson.hash
index 852dc6781..7c5819316 100644
--- a/package/lua-cjson/lua-cjson.hash
+++ b/package/lua-cjson/lua-cjson.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	db7af849c555d1a474f729fe4a56b5530e9be7b24749eb7a7c474a7c7207b972  lua-cjson-2.1.0-1.src.rock
+# computed by luarocks/buildroot
+sha256 db7af849c555d1a474f729fe4a56b5530e9be7b24749eb7a7c474a7c7207b972  lua-cjson-2.1.0-1.src.rock
+sha256 9576e82ef5013fbe80b3bd446a7d9ddd47328baa2186c31d3d885e2a9a8cd31e  lua-cjson-2.1.0/LICENSE
diff --git a/package/lua-coat/lua-coat.hash b/package/lua-coat/lua-coat.hash
index 1f2135566..491ba2964 100644
--- a/package/lua-coat/lua-coat.hash
+++ b/package/lua-coat/lua-coat.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	24d0e894d743f46c09a282e4dd272d2a6004557608b618c1c9d9f464dd65af02  lua-coat-0.9.2-1.src.rock
+# computed by luarocks/buildroot
+sha256 24d0e894d743f46c09a282e4dd272d2a6004557608b618c1c9d9f464dd65af02  lua-coat-0.9.2-1.src.rock
+sha256 81b5f657812ccfd63f19c9af1389b5fe6b26f079a4841c5d074940c47bf7cb1e  lua-Coat-0.9.2/COPYRIGHT
diff --git a/package/lua-coatpersistent/lua-coatpersistent.hash b/package/lua-coatpersistent/lua-coatpersistent.hash
index eeb13bb1c..a15379e13 100644
--- a/package/lua-coatpersistent/lua-coatpersistent.hash
+++ b/package/lua-coatpersistent/lua-coatpersistent.hash
@@ -1,3 +1,4 @@
-# Locally calculated
-sha256	e718ee36a17312108f266e8412f840db150afd89e8587d36e685673fff65f142  lua-coatpersistent-lsqlite3-0.2.2-1.src.rock
-sha256	5d36d6a8b413a2d56a466a45314291a0265c514a179e741b3fc95f4dd901abe6  lua-coatpersistent-luasql-0.2.2-1.src.rock
+# computed by luarocks/buildroot
+sha256 e718ee36a17312108f266e8412f840db150afd89e8587d36e685673fff65f142  lua-coatpersistent-lsqlite3-0.2.2-1.src.rock
+sha256 5d36d6a8b413a2d56a466a45314291a0265c514a179e741b3fc95f4dd901abe6  lua-coatpersistent-luasql-0.2.2-1.src.rock
+sha256 f8ed30644056ceff4315e694a1c1af4af4f08ec0adabae353ab8f3f5289ffbf3  lua-CoatPersistent-0.2.2/COPYRIGHT
diff --git a/package/lua-compat53/lua-compat53.hash b/package/lua-compat53/lua-compat53.hash
index f311b9ce8..b40596f86 100644
--- a/package/lua-compat53/lua-compat53.hash
+++ b/package/lua-compat53/lua-compat53.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 cb5fdca362780a30405c4134310ea78627a092b0ee8445a52456f2fceeeaea4e  compat53-0.7-1.src.rock
+sha256 1b24f475812c979684fb3469f6faccbdc7c33c9d39421728aa0d78deda5a89a5  lua-compat-5.3-0.7/LICENSE
diff --git a/package/lua-csnappy/lua-csnappy.hash b/package/lua-csnappy/lua-csnappy.hash
index f88742644..43790f2bd 100644
--- a/package/lua-csnappy/lua-csnappy.hash
+++ b/package/lua-csnappy/lua-csnappy.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	4fc373ba714cb8b428e9971f1725d82de6a43dfea361a0b7894e4762238dc95c  lua-csnappy-0.1.5-1.src.rock
+# computed by luarocks/buildroot
+sha256 4fc373ba714cb8b428e9971f1725d82de6a43dfea361a0b7894e4762238dc95c  lua-csnappy-0.1.5-1.src.rock
+sha256 8865da757dbc6fe3c8cee4d88bdfd82c1e0e789974a4d0d52db75a985025c1f0  lua-csnappy-0.1.5/COPYRIGHT
diff --git a/package/lua-curl/lua-curl.hash b/package/lua-curl/lua-curl.hash
index e73810ced..92955febe 100644
--- a/package/lua-curl/lua-curl.hash
+++ b/package/lua-curl/lua-curl.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 4cc6389bf5d4a868cc1e6017733b9b6306f2fc8b5083aa928d66399195697f34  lua-curl-0.3.7-1.src.rock
+sha256 3cc2f54f1d58008d16264ed6e560b6424283dda7f8f9155f777ffd496574b2ae  Lua-cURLv3-0.3.7/LICENSE
diff --git a/package/lua-datafile/lua-datafile.hash b/package/lua-datafile/lua-datafile.hash
index 83c346eae..afb7e8adf 100644
--- a/package/lua-datafile/lua-datafile.hash
+++ b/package/lua-datafile/lua-datafile.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 37a33079c3476477f19de14bebd664635a39a57dd05a2709c3a402cbc1e79a6b  datafile-0.4-1.src.rock
+sha256 0443ddabab14f69d4c5e2641860343784a0ccbe5ae7a3743f20de9a13991da66  datafile/LICENSE
diff --git a/package/lua-fifo/lua-fifo.hash b/package/lua-fifo/lua-fifo.hash
index bab372804..7d885f413 100644
--- a/package/lua-fifo/lua-fifo.hash
+++ b/package/lua-fifo/lua-fifo.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 53dea24ad658614a0254dcb10296a1a0fc5357315ada5724d6362f54c32b4c20  fifo-0.2-0.src.rock
+sha256 8b4423dd4f55a69da1454b7a48346a54fd5b6e0408b38fde25cd29c0922962b6  fifo.lua-0.2/LICENSE
diff --git a/package/lua-flu/lua-flu.hash b/package/lua-flu/lua-flu.hash
index 92a0a13ff..2195b4246 100644
--- a/package/lua-flu/lua-flu.hash
+++ b/package/lua-flu/lua-flu.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	1389c22daec77161ec93ff90c39ee70e0f8a656ff92f22f9cf5d7121999d5c53  flu-20150331-1.src.rock
+# computed by luarocks/buildroot
+sha256 1389c22daec77161ec93ff90c39ee70e0f8a656ff92f22f9cf5d7121999d5c53  flu-20150331-1.src.rock
+sha256 409f7c274eb26874a382241d675a360ba6b2659742c5941e680d71a41dd35913  doub-flu-a7daae986339/doc/LICENSE.txt
diff --git a/package/lua-http/lua-http.hash b/package/lua-http/lua-http.hash
index 2346ab97a..3c7bcebd3 100644
--- a/package/lua-http/lua-http.hash
+++ b/package/lua-http/lua-http.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 d68591eeeeb60c4187469eae89f5bad02d753a8c0adaa460d453b0734222645a  http-0.2-0.src.rock
+sha256 10650e71ba335c76955bbbec2b1f5b9d5655f2e0fdc6c7cecae5bd28a376302c  lua-http-0.2/LICENSE.md
diff --git a/package/lua-iconv/lua-iconv.hash b/package/lua-iconv/lua-iconv.hash
index 46291026c..8015599e4 100644
--- a/package/lua-iconv/lua-iconv.hash
+++ b/package/lua-iconv/lua-iconv.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	fb66e785e15376c2d2817f1f1b27d10272b877eacc998c727a10f081a7d768fa  lua-iconv-7-1.src.rock
+# computed by luarocks/buildroot
+sha256 fb66e785e15376c2d2817f1f1b27d10272b877eacc998c727a10f081a7d768fa  lua-iconv-7-1.src.rock
+sha256 30227b9571827f3dfcdeb3830594fc415459d64ad7271e9954178d3ef58a9bd4  lua-iconv-7/COPYING
diff --git a/package/lua-lpeg-patterns/lua-lpeg-patterns.hash b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
index f779466df..fb19515c3 100644
--- a/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
+++ b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 82c8eddee52069e5ae821b68cb9e295ab5767a47d07545a4ca36ac1e81066086  lpeg_patterns-0.4-0.src.rock
+sha256 5b0346f2b2432e5f05e8e4ad31503cf84ddf802dacde9e8c3e529efaa4be3348  lpeg_patterns-0.4/LICENSE.md
diff --git a/package/lua-markdown/lua-markdown.hash b/package/lua-markdown/lua-markdown.hash
index 9bfbf6007..682b4f84c 100644
--- a/package/lua-markdown/lua-markdown.hash
+++ b/package/lua-markdown/lua-markdown.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 bed84231bb48322f8e614b4392181c52c36bc71340f9273e0c3bd72dc922bc07  markdown-0.33-1.src.rock
+sha256 c13c5634db49d16c87f164ce0b79fb7e1b313c8b66818ebf1c970747a429b39b  markdown/LICENSE
diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index 86ea5d088..aa1a1b541 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,3 +1,4 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 a27d985b8bdb79ebe78dfe255c795e839a04eb2fed1c610a81c7876e3f72fd97  lua-messagepack-0.5.1-1.src.rock
 sha256 b7f69ada6aed7e0cdfd690291607d8f41246e67f191107ecdc0a1e592c449abe  lua-messagepack-lua53-0.5.1-1.src.rock
+sha256 e409ff1f089c1cd36840349fd790a6ffce5a31f16d30c108ce94aaa3b128dcea  lua-MessagePack-0.5.1/COPYRIGHT
diff --git a/package/lua-periphery/lua-periphery.hash b/package/lua-periphery/lua-periphery.hash
index 7f6e63f3b..713d5c098 100644
--- a/package/lua-periphery/lua-periphery.hash
+++ b/package/lua-periphery/lua-periphery.hash
@@ -1,2 +1,3 @@
-# Locally computed
-sha256  53762ed9b8a2edfcc5b4c535ef73e6a425f2577e036bb15994ca16a39b16ebab  lua-periphery-1.0.6-1.src.rock
+# computed by luarocks/buildroot
+sha256 53762ed9b8a2edfcc5b4c535ef73e6a425f2577e036bb15994ca16a39b16ebab  lua-periphery-1.0.6-1.src.rock
+sha256 7c60847b46f718e9651d1eca2f56bf6be09608cf08d130446a521eb8288c98e1  lua-periphery/LICENSE
diff --git a/package/lua-resty-http/lua-resty-http.hash b/package/lua-resty-http/lua-resty-http.hash
index e45df0e91..486a110a7 100644
--- a/package/lua-resty-http/lua-resty-http.hash
+++ b/package/lua-resty-http/lua-resty-http.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 4628413a5a2828645e3ddb38a2a0c764e81443cbd1a011357eeed7e983750329  lua-resty-http-0.12-0.src.rock
+sha256 407e4b1412d8afa317dc703a1d318866c3de87d78899402125cbd90548c6057d  lua-resty-http/LICENSE
diff --git a/package/lua-sailor/lua-sailor.hash b/package/lua-sailor/lua-sailor.hash
index f4c42cccc..aec00afe5 100644
--- a/package/lua-sailor/lua-sailor.hash
+++ b/package/lua-sailor/lua-sailor.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 4f7f43a7cf6c62712a521ebaf5f53aaf230039c7fb06480ae168c3aa036120bf  sailor-0.5-4.src.rock
+sha256 3a19bc44e1a653b39bcb1b91cc8058ac6b1cd1caf7e6cef93517fd559b189065  sailor/LICENSE
diff --git a/package/lua-stdlib/lua-stdlib.hash b/package/lua-stdlib/lua-stdlib.hash
index 4882bf1e7..35d6dffe2 100644
--- a/package/lua-stdlib/lua-stdlib.hash
+++ b/package/lua-stdlib/lua-stdlib.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 b7302ecc8ea3992d3bad96c0c4d56272e38d786d16cc1ad5964fefa73fd7c10b  stdlib-41.2.1-1.src.rock
+sha256 d3177e0cd97e6ef7c459aa2c6a85f53d9b4ff091f7f296d4ed8bfaf713b6fea2  lua-stdlib-release-v41.2.1/COPYING
diff --git a/package/lua-testmore/lua-testmore.hash b/package/lua-testmore/lua-testmore.hash
index 8db664f2d..673e1cf60 100644
--- a/package/lua-testmore/lua-testmore.hash
+++ b/package/lua-testmore/lua-testmore.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	163055ef92df9e01d9ae57cd45d6f6aace1ff4dd3abf7e29b9e30ecb1ab76ae2  lua-testmore-0.3.3-1.src.rock
+# computed by luarocks/buildroot
+sha256 163055ef92df9e01d9ae57cd45d6f6aace1ff4dd3abf7e29b9e30ecb1ab76ae2  lua-testmore-0.3.3-1.src.rock
+sha256 0fa63370a149eda33e25987dd63bd096a616a3e47d2cfc45ca2fd66e8d2bfb35  lua-TestMore-0.3.3/COPYRIGHT
diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
index 51fa2439f..e119f9435 100644
--- a/package/lua-utf8/lua-utf8.hash
+++ b/package/lua-utf8/lua-utf8.hash
@@ -1,2 +1,2 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 c9ceb3a9f327b3215cdf959eebf616970b5b0427ca3fde05b19f8236defa4b91  utf8-1.2-0.src.rock
diff --git a/package/lua-valua/lua-valua.hash b/package/lua-valua/lua-valua.hash
index 92ea61311..71d43e4fa 100644
--- a/package/lua-valua/lua-valua.hash
+++ b/package/lua-valua/lua-valua.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 bff39692fd2ac3590fd814aa1b1ca33e5d5971092955309aa8424b02b88ce1a3  valua-0.3-1.src.rock
+sha256 3444c2e739c88e41e327c6cd15e4a50fea8988570642bad6e6a43d50a7f7961f  valua/LICENSE
diff --git a/package/luabitop/luabitop.hash b/package/luabitop/luabitop.hash
index 78110205a..6f36bd18b 100644
--- a/package/luabitop/luabitop.hash
+++ b/package/luabitop/luabitop.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	fc7a8065a57462ee13bed7f95b0ab13f94ecd1bf846108c61ccf2c75548af26e  luabitop-1.0.2-1.src.rock
+# computed by luarocks/buildroot
+sha256 fc7a8065a57462ee13bed7f95b0ab13f94ecd1bf846108c61ccf2c75548af26e  luabitop-1.0.2-1.src.rock
diff --git a/package/luacrypto/luacrypto.hash b/package/luacrypto/luacrypto.hash
index 5c577672e..5d600b054 100644
--- a/package/luacrypto/luacrypto.hash
+++ b/package/luacrypto/luacrypto.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	dc935c923b8851208d5d504b343448a9d5bd3e537bb8657875f12d72155600b8  luacrypto-0.3.2-1.src.rock
+# computed by luarocks/buildroot
+sha256 dc935c923b8851208d5d504b343448a9d5bd3e537bb8657875f12d72155600b8  luacrypto-0.3.2-1.src.rock
+sha256 f97651bcb248dff32f121ef7a904617b9252d80f4b911e4476806c512a268fa9  luacrypto-0.3.2/COPYING
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.hash b/package/luadbi-sqlite3/luadbi-sqlite3.hash
index bd8b927fa..093a9067f 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.hash
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 2868dad4d189368fcf5cddd191965c8cb2efaa3a3ba83d50e6a88c30353f74ce  luadbi-sqlite3-0.6-2.src.rock
+sha256 988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi/luadbi.hash b/package/luadbi/luadbi.hash
index e5c022bdf..d72690d9a 100644
--- a/package/luadbi/luadbi.hash
+++ b/package/luadbi/luadbi.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 723f63b744b7367ddfd6bbf7a7e6f6867aa1eaabbbc2bab5dc8a90e80b0c34c2  luadbi-0.6-2.src.rock
+sha256 988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luaexpat/luaexpat.hash b/package/luaexpat/luaexpat.hash
index 27f6ed034..fbfb0bc9a 100644
--- a/package/luaexpat/luaexpat.hash
+++ b/package/luaexpat/luaexpat.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	aa7883a0d44f500e32ef306c04632546f97f33159fffa7bcdc3f451170f95896  luaexpat-1.3.0-1.src.rock
+# computed by luarocks/buildroot
+sha256 aa7883a0d44f500e32ef306c04632546f97f33159fffa7bcdc3f451170f95896  luaexpat-1.3.0-1.src.rock
+sha256 c0dd2263f9044685b3d89d0f2b208fb60d9d141f5bd80a280beefa53e373a42f  luaexpat-1.3.0/doc/us/license.html
diff --git a/package/luafilesystem/luafilesystem.hash b/package/luafilesystem/luafilesystem.hash
index bd4a446cf..9afc05c25 100644
--- a/package/luafilesystem/luafilesystem.hash
+++ b/package/luafilesystem/luafilesystem.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 65e6d437e577a1d6cd509b6cd224d2cb9501d58d32a72cafbd4fd3f911681576  luafilesystem-1.7.0-2.src.rock
+sha256 beb2c9eed6466d572c3888028a77421206053a3c023429cbd69e5015badba842  luafilesystem/LICENSE
diff --git a/package/luajson/luajson.hash b/package/luajson/luajson.hash
index 36534fe34..3b7885aa7 100644
--- a/package/luajson/luajson.hash
+++ b/package/luajson/luajson.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 28a5928cf2e4fd79fa9a9aceaef5ebf1dccb1146489b7de4c2726f561700f01c  luajson-1.3.4-1.src.rock
+sha256 87565fca189b70f2e119b2a99e5e92a7aaab9f2eb05228b56b88e6c2e2f98bcd  luajson/LICENSE
diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index 8a6211ec3..e2ba5df3a 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	6ca3827c4903814626b96011e17ad99b42ecfa983b605aa75bf58f17e90ed58d  lualogging-1.3.0-1.src.rock
+# computed by luarocks/buildroot
+sha256 6ca3827c4903814626b96011e17ad99b42ecfa983b605aa75bf58f17e90ed58d  lualogging-1.3.0-1.src.rock
+sha256 4e86086c032a006ce1289565cc9d9afff26b5117891cd26ffa15aa866bd28ee5  lualogging/COPYRIGHT
diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index 8c91a1fcf..c091f6b83 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 f9c94c97579efddf8abad1e373e0fe0ecc93d00cd9d1bd49f48c5716c281a08b  luaossl-20171028-0.src.rock
+sha256 5f4b1f94047790eadf8fd0f9a8e3bd2895bea4c9a2c0f8bf7cd8c8e57caa5219  luaossl-rel-20171028/LICENSE
diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 1fdbe7d7e..37fc08d45 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	383e183ba712f00b2fcbf60187177432ccde724a23ac6186075ceae620cf0b0a  luasec-0.7-1.src.rock
+# computed by luarocks/buildroot
+sha256 383e183ba712f00b2fcbf60187177432ccde724a23ac6186075ceae620cf0b0a  luasec-0.7-1.src.rock
+sha256 b310a4c5a9927a43123e3ffcfaa5f5921b545b64d38ea55c7faf2a837547a200  luasec-luasec-0.7/LICENSE
diff --git a/package/luasocket/luasocket.hash b/package/luasocket/luasocket.hash
index ad91f4420..843647b27 100644
--- a/package/luasocket/luasocket.hash
+++ b/package/luasocket/luasocket.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	453fc1d0e9b6a44bbada4290d565f840a5e96ba2d1b47562ba38bd9c7e82195a  luasocket-3.0rc1-1.src.rock
+# computed by luarocks/buildroot
+sha256 453fc1d0e9b6a44bbada4290d565f840a5e96ba2d1b47562ba38bd9c7e82195a  luasocket-3.0rc1-1.src.rock
+sha256 8e8c6314d9e78fe452ee355167f2c40cfbee8207e14dcb5ddd4a2655cb5c6aad  luasocket-3.0-rc1/LICENSE
diff --git a/package/luasql-sqlite3/luasql-sqlite3.hash b/package/luasql-sqlite3/luasql-sqlite3.hash
index 5728c8db0..b7ec1bd06 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.hash
+++ b/package/luasql-sqlite3/luasql-sqlite3.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	e98d4e997682097f5bc2859596b9615f4cb87438db23ceb4af5e36b4424524ab  luasql-sqlite3-2.3.0-1.src.rock
+# computed by luarocks/buildroot
+sha256 e98d4e997682097f5bc2859596b9615f4cb87438db23ceb4af5e36b4424524ab  luasql-sqlite3-2.3.0-1.src.rock
+sha256 e38362f9533fa0325f0f1e2ec6284c386cad6d8b5f2e548d20b4a3af31e7b5da  luasql/doc/us/license.html
diff --git a/package/lunit/lunit.hash b/package/lunit/lunit.hash
index 9c8d53c5e..bd168ba8f 100644
--- a/package/lunit/lunit.hash
+++ b/package/lunit/lunit.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	b19854c685337ddcec2fe9c22113d2cd14715d52ccd2676abe2fa49b61a2ec4d  lunit-0.5-2.src.rock
+# computed by luarocks/buildroot
+sha256 b19854c685337ddcec2fe9c22113d2cd14715d52ccd2676abe2fa49b61a2ec4d  lunit-0.5-2.src.rock
+sha256 316317e9e9b7eac811e1be56738e2434fb4a0c39ecd660f3b34dad739bfb3707  lunit-0.5/LICENSE
diff --git a/package/orbit/orbit.hash b/package/orbit/orbit.hash
index 9662a650a..eb427b63b 100644
--- a/package/orbit/orbit.hash
+++ b/package/orbit/orbit.hash
@@ -1,2 +1,4 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 91e3c514d5b86918db83666c8889635bb2d50c71d1ab3aeb69c6469c9424089b  orbit-2.2.4-1.src.rock
+sha256 dd7d37caed0f4ee994e9e64ea4ab292dce549bb609412c84fc47ed079275ae98  orbit/doc/us/license.html
+sha256 140134369c1f041abf7d8cd39a5b0c42f8b5e827695ce7c1ef5ca8f0911a0246  orbit/doc/us/license.md
diff --git a/package/rings/rings.hash b/package/rings/rings.hash
index 59da2fa32..c9a758b54 100644
--- a/package/rings/rings.hash
+++ b/package/rings/rings.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	627ac55d4a420fab766e6870fcd82cb39da12fb4ec8efddc7220b188a4ad4bc3  rings-1.3.0-1.src.rock
+# computed by luarocks/buildroot
+sha256 627ac55d4a420fab766e6870fcd82cb39da12fb4ec8efddc7220b188a4ad4bc3  rings-1.3.0-1.src.rock
+sha256 f582a0c43737391070827ef273df0145b594b095ad2f49595701368b729e024f  rings-v_1_3_0/doc/us/license.html
diff --git a/package/wsapi-fcgi/wsapi-fcgi.hash b/package/wsapi-fcgi/wsapi-fcgi.hash
index f82ce9cfc..1472e894f 100644
--- a/package/wsapi-fcgi/wsapi-fcgi.hash
+++ b/package/wsapi-fcgi/wsapi-fcgi.hash
@@ -1,2 +1,4 @@
-# locally computed hash
+# computed by luarocks/buildroot
 sha256 73dc200889bc185953cd3a7c5350c998c090f901fcd10771273b7a63a3ffcdcf  wsapi-fcgi-1.6.1-1.src.rock
+sha256 6aa14e3febf7a9e810ce672b015f5a5514241ce5d1c3a6a48f921f089d270159  wsapi-1.6.1/doc/us/license.html
+sha256 c7bf3061d00a96d10cb9dbc3a737d0af22594e2ef8f788842d7ab92eeaa864f2  wsapi-1.6.1/doc/us/license.md
diff --git a/package/wsapi-xavante/wsapi-xavante.hash b/package/wsapi-xavante/wsapi-xavante.hash
index 9e8132df5..607bcdd7b 100644
--- a/package/wsapi-xavante/wsapi-xavante.hash
+++ b/package/wsapi-xavante/wsapi-xavante.hash
@@ -1,2 +1,4 @@
-# locally computed hash
+# computed by luarocks/buildroot
 sha256 b30b171e3d4d6fd7e129f14576e1cfc5adf00c0780ef8350f2f9e6f1d4259346  wsapi-xavante-1.6.1-1.src.rock
+sha256 6aa14e3febf7a9e810ce672b015f5a5514241ce5d1c3a6a48f921f089d270159  wsapi-1.6.1/doc/us/license.html
+sha256 c7bf3061d00a96d10cb9dbc3a737d0af22594e2ef8f788842d7ab92eeaa864f2  wsapi-1.6.1/doc/us/license.md
diff --git a/package/wsapi/wsapi.hash b/package/wsapi/wsapi.hash
index 3abbfc979..cf605d9dd 100644
--- a/package/wsapi/wsapi.hash
+++ b/package/wsapi/wsapi.hash
@@ -1,2 +1,4 @@
-# locally computed hash
-sha256 f7f1b0ddc68c257965c42ac7155904d8ff7c2b7256f65ef1b82fda0039137d61 wsapi-1.6.1-1.src.rock
+# computed by luarocks/buildroot
+sha256 f7f1b0ddc68c257965c42ac7155904d8ff7c2b7256f65ef1b82fda0039137d61  wsapi-1.6.1-1.src.rock
+sha256 6aa14e3febf7a9e810ce672b015f5a5514241ce5d1c3a6a48f921f089d270159  wsapi-1.6.1/doc/us/license.html
+sha256 c7bf3061d00a96d10cb9dbc3a737d0af22594e2ef8f788842d7ab92eeaa864f2  wsapi-1.6.1/doc/us/license.md
diff --git a/package/xavante/xavante.hash b/package/xavante/xavante.hash
index 09b2a22d4..b2e8633bc 100644
--- a/package/xavante/xavante.hash
+++ b/package/xavante/xavante.hash
@@ -1,2 +1,3 @@
-# Locally calculated
+# computed by luarocks/buildroot
 sha256 67c738f981e7d65d18c717f3acac59a37f95d5139c00fb0de5d3167262025273  xavante-2.4.0-1.src.rock
+sha256 57b2c50f08bf500c969fe13500f217adb36582e4d8e75c9e2ed04191cb4a045c  xavante-2.4.0/doc/us/license.html
-- 
2.17.1
