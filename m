From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 10 Nov 2018 15:08:31 +0100
Subject: [Buildroot] [PATCH 4/5] lua*: regeneration of hash files
In-Reply-To: <20181110140832.9700-1-francois.perrad@gadz.org>
References: <20181110140832.9700-1-francois.perrad@gadz.org>
Message-ID: <20181110140832.9700-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/argparse/argparse.hash                     | 5 +++--
 package/cgilua/cgilua.hash                         | 5 +++--
 package/copas/copas.hash                           | 5 +++--
 package/coxpcall/coxpcall.hash                     | 5 +++--
 package/dado/dado.hash                             | 5 +++--
 package/ljlinenoise/ljlinenoise.hash               | 5 +++--
 package/lpeg/lpeg.hash                             | 4 ++--
 package/lpty/lpty.hash                             | 5 +++--
 package/lrandom/lrandom.hash                       | 6 +++---
 package/lsqlite3/lsqlite3.hash                     | 4 ++--
 package/lua-basexx/lua-basexx.hash                 | 5 +++--
 package/lua-bit32/lua-bit32.hash                   | 5 +++--
 package/lua-cjson/lua-cjson.hash                   | 5 +++--
 package/lua-coat/lua-coat.hash                     | 5 +++--
 package/lua-coatpersistent/lua-coatpersistent.hash | 7 ++++---
 package/lua-compat53/lua-compat53.hash             | 5 +++--
 package/lua-csnappy/lua-csnappy.hash               | 5 +++--
 package/lua-curl/lua-curl.hash                     | 5 +++--
 package/lua-datafile/lua-datafile.hash             | 5 +++--
 package/lua-fifo/lua-fifo.hash                     | 5 +++--
 package/lua-flu/lua-flu.hash                       | 5 +++--
 package/lua-http/lua-http.hash                     | 5 +++--
 package/lua-iconv/lua-iconv.hash                   | 5 +++--
 package/lua-lpeg-patterns/lua-lpeg-patterns.hash   | 5 +++--
 package/lua-markdown/lua-markdown.hash             | 5 +++--
 package/lua-messagepack/lua-messagepack.hash       | 6 +++---
 package/lua-periphery/lua-periphery.hash           | 5 +++--
 package/lua-resty-http/lua-resty-http.hash         | 5 +++--
 package/lua-sailor/lua-sailor.hash                 | 5 +++--
 package/lua-stdlib/lua-stdlib.hash                 | 5 +++--
 package/lua-testmore/lua-testmore.hash             | 5 +++--
 package/lua-utf8/lua-utf8.hash                     | 4 ++--
 package/lua-valua/lua-valua.hash                   | 5 +++--
 package/luabitop/luabitop.hash                     | 4 ++--
 package/luacrypto/luacrypto.hash                   | 5 +++--
 package/luadbi-sqlite3/luadbi-sqlite3.hash         | 5 +++--
 package/luadbi/luadbi.hash                         | 5 +++--
 package/luaexpat/luaexpat.hash                     | 5 +++--
 package/luafilesystem/luafilesystem.hash           | 5 +++--
 package/luajson/luajson.hash                       | 5 +++--
 package/lualogging/lualogging.hash                 | 5 +++--
 package/luaossl/luaossl.hash                       | 5 +++--
 package/luasec/luasec.hash                         | 5 +++--
 package/luasocket/luasocket.hash                   | 5 +++--
 package/luasql-sqlite3/luasql-sqlite3.hash         | 5 +++--
 package/lunit/lunit.hash                           | 5 +++--
 package/orbit/orbit.hash                           | 6 ++++--
 package/rings/rings.hash                           | 5 +++--
 package/wsapi-fcgi/wsapi-fcgi.hash                 | 6 ++++--
 package/wsapi-xavante/wsapi-xavante.hash           | 6 ++++--
 package/wsapi/wsapi.hash                           | 6 ++++--
 package/xavante/xavante.hash                       | 5 +++--
 52 files changed, 157 insertions(+), 107 deletions(-)

diff --git a/package/argparse/argparse.hash b/package/argparse/argparse.hash
index a4746bc6a..11bb1aaeb 100644
--- a/package/argparse/argparse.hash
+++ b/package/argparse/argparse.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	e00e5637c937d7bfca96025f2c598ba4fffe9eb818d69952e77b4c08167a6be3  argparse-0.5.0-1.src.rock
+# computed by luarocks
+md5 391f4d09d1b419dc8a4aa784839d0646  argparse-0.5.0-1.src.rock
+md5 273d2bcf03a1d99950e5fd71d44f754e  argparse/LICENSE
diff --git a/package/cgilua/cgilua.hash b/package/cgilua/cgilua.hash
index b932e80cb..973c8fc39 100644
--- a/package/cgilua/cgilua.hash
+++ b/package/cgilua/cgilua.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 7d4883e6a89b3463a1d35b8084a6e2afbbb584af7aca1169380e92af0f848413  cgilua-5.2.1-1.src.rock
+# computed by luarocks
+md5 2f9bd7229fbfaeafa9af1932069e959b  cgilua-5.2.1-1.src.rock
+md5 a6d82602468661f8bf62e14852747eb5  cgilua-5.2.1/doc/us/license.html
diff --git a/package/copas/copas.hash b/package/copas/copas.hash
index d894b8657..49f314ec0 100644
--- a/package/copas/copas.hash
+++ b/package/copas/copas.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 efeded4f4633bc71551175b239199304640ef918ae8ea9dc9c5047359ae07107  copas-2.0.2-1.src.rock
+# computed by luarocks
+md5 aa1f534c51285df0ffc7dac8e03636a9  copas-2.0.2-1.src.rock
+md5 645b1830ec92fd164695dd9e47b4d035  copas-2_0_2/LICENSE
diff --git a/package/coxpcall/coxpcall.hash b/package/coxpcall/coxpcall.hash
index e037af9e8..3819c081f 100644
--- a/package/coxpcall/coxpcall.hash
+++ b/package/coxpcall/coxpcall.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 c1488ee08e5d25d59a11e19cb0322edae509202b246d0c93cb2de1676dbfdf2b  coxpcall-1.16.0-1.src.rock
+# computed by luarocks
+md5 461239348c2570963042946ff8b56b1c  coxpcall-1.16.0-1.src.rock
+md5 ca5f7ed35804bc8934157fcca1ca9f96  coxpcall/doc/license.html
diff --git a/package/dado/dado.hash b/package/dado/dado.hash
index 973bdb3ff..194bf2063 100644
--- a/package/dado/dado.hash
+++ b/package/dado/dado.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 5a10ed7ff7be34ac004d10d6ea62ee8efc2b594c50ffc93e840e7fb7a2e6b4d0  dado-1.8.3-1.src.rock
+# computed by luarocks
+md5 f92901351aaa9d001a13a7792c1e5aa1  dado-1.8.3-1.src.rock
+md5 a0e51e3669465502276ce55f59d4cfa3  dado-1.8.3/doc/license.html
diff --git a/package/ljlinenoise/ljlinenoise.hash b/package/ljlinenoise/ljlinenoise.hash
index c70b5d680..816a151de 100644
--- a/package/ljlinenoise/ljlinenoise.hash
+++ b/package/ljlinenoise/ljlinenoise.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	7a6c4142b0096106f498d7ee4bea5bf5086c076d1f071893441b8e5c0665fb47  ljlinenoise-0.1.3-1.src.rock
+# computed by luarocks
+md5 eb7d496550eacf296e3df40eb3aba332  ljlinenoise-0.1.3-1.src.rock
+md5 7afa1f016dd59a9189a3d70d18c71b55  ljlinenoise-0.1.3/COPYRIGHT
diff --git a/package/lpeg/lpeg.hash b/package/lpeg/lpeg.hash
index 926167486..8666b4a4f 100644
--- a/package/lpeg/lpeg.hash
+++ b/package/lpeg/lpeg.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	149be31e0155c4694f77ea7264d9b398dd134eca0d00ff03358d91a6cfb2ea9d  lpeg-1.0.1-1.src.rock
+# computed by luarocks
+md5 4495e74bbac9723ed64540a35a74ef70  lpeg-1.0.1-1.src.rock
diff --git a/package/lpty/lpty.hash b/package/lpty/lpty.hash
index a451fd858..a9acf4a85 100644
--- a/package/lpty/lpty.hash
+++ b/package/lpty/lpty.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	cf263ece9b50a78a7fb2277e3546fbbf0bf6858f41821932d92f2e3d8a065091  lpty-1.0.1-1.src.rock
+# computed by luarocks
+md5 c0fc1232fb5ba3322e56f32bca037059  lpty-1.0.1-1.src.rock
+md5 f01dc254a838d0aac5517c635439977c  lpty-1.0.1-1/doc/LICENSE
diff --git a/package/lrandom/lrandom.hash b/package/lrandom/lrandom.hash
index 3f601330c..94d6bd584 100644
--- a/package/lrandom/lrandom.hash
+++ b/package/lrandom/lrandom.hash
@@ -1,3 +1,3 @@
-# Locally calculated
-sha256	96fbc56beb0efca20253301915e14ba25150e2b09541ea7a3570e0def624b196  lrandom-20120430.51-1.src.rock
-sha256	480a6cf11caaba99290ff30cd6e854ac9dce61e38b9d9caf5498165f7fb93454  lrandom-20120430.52-1.src.rock
+# computed by luarocks
+md5 dc9ea075298eacd4638e50d83bc83082  lrandom-20120430.51-1.src.rock
+md5 d90cd3f6cf4fea7e2f09aa5adee79f9e  lrandom-20120430.52-1.src.rock
diff --git a/package/lsqlite3/lsqlite3.hash b/package/lsqlite3/lsqlite3.hash
index 7cf0358d1..a28c2aad7 100644
--- a/package/lsqlite3/lsqlite3.hash
+++ b/package/lsqlite3/lsqlite3.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	e6eb64a7ca3727c3093f3c37341d8ecadf9eac913e468eae413828476b19c225  lsqlite3-0.9.4-2.src.rock
+# computed by luarocks
+md5 89a4ccc97791afc3bdb9b49de003452a  lsqlite3-0.9.4-2.src.rock
diff --git a/package/lua-basexx/lua-basexx.hash b/package/lua-basexx/lua-basexx.hash
index 91c428c14..9a6248660 100644
--- a/package/lua-basexx/lua-basexx.hash
+++ b/package/lua-basexx/lua-basexx.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 ff5379b1f5b396103b8bb589ab3dd94d0a727c8e7a48dcfe1c73e2f07af6a8df  basexx-0.4.0-1.src.rock
+# computed by luarocks
+md5 6eda8376ee10f4069e6f1504e59993b1  basexx-0.4.0-1.src.rock
+md5 44eb1eb9f17513f576f511cd508ce020  basexx-0.4.0/LICENSE
diff --git a/package/lua-bit32/lua-bit32.hash b/package/lua-bit32/lua-bit32.hash
index 21dbd0531..47832c7c9 100644
--- a/package/lua-bit32/lua-bit32.hash
+++ b/package/lua-bit32/lua-bit32.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256  fe7bc70d1e48183d95ccfb6741e70a676283075173122cb161303d77059b27a6  bit32-5.3.0-1.src.rock
+# computed by luarocks
+md5 caa57f00422443aaa96ef59371bce3c5  bit32-5.3.0-1.src.rock
+md5 d3bf3c07c9585e444c8010120cf66618  lua-compat-5.2/LICENSE
diff --git a/package/lua-cjson/lua-cjson.hash b/package/lua-cjson/lua-cjson.hash
index 852dc6781..f1c271240 100644
--- a/package/lua-cjson/lua-cjson.hash
+++ b/package/lua-cjson/lua-cjson.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	db7af849c555d1a474f729fe4a56b5530e9be7b24749eb7a7c474a7c7207b972  lua-cjson-2.1.0-1.src.rock
+# computed by luarocks
+md5 10c6ed9ee0959fd624c3dffe698798b5  lua-cjson-2.1.0-1.src.rock
+md5 b1fee3afe4f4a4b26c13016123b2d08a  lua-cjson-2.1.0/LICENSE
diff --git a/package/lua-coat/lua-coat.hash b/package/lua-coat/lua-coat.hash
index 1f2135566..0d4b37b7a 100644
--- a/package/lua-coat/lua-coat.hash
+++ b/package/lua-coat/lua-coat.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	24d0e894d743f46c09a282e4dd272d2a6004557608b618c1c9d9f464dd65af02  lua-coat-0.9.2-1.src.rock
+# computed by luarocks
+md5 730c51ca9f2fe1cc6ca52407782e6190  lua-coat-0.9.2-1.src.rock
+md5 ac090bb9a4ae607ede2a49028734be10  lua-Coat-0.9.2/COPYRIGHT
diff --git a/package/lua-coatpersistent/lua-coatpersistent.hash b/package/lua-coatpersistent/lua-coatpersistent.hash
index eeb13bb1c..cb876799e 100644
--- a/package/lua-coatpersistent/lua-coatpersistent.hash
+++ b/package/lua-coatpersistent/lua-coatpersistent.hash
@@ -1,3 +1,4 @@
-# Locally calculated
-sha256	e718ee36a17312108f266e8412f840db150afd89e8587d36e685673fff65f142  lua-coatpersistent-lsqlite3-0.2.2-1.src.rock
-sha256	5d36d6a8b413a2d56a466a45314291a0265c514a179e741b3fc95f4dd901abe6  lua-coatpersistent-luasql-0.2.2-1.src.rock
+# computed by luarocks
+md5 d828924501411c960814f5288ac66f82  lua-coatpersistent-lsqlite3-0.2.2-1.src.rock
+md5 9b25be9a20635c9721092a142c69f454  lua-coatpersistent-luasql-0.2.2-1.src.rock
+md5 9b74b04b513ad692d65df89ef943cf10  lua-CoatPersistent-0.2.2/COPYRIGHT
diff --git a/package/lua-compat53/lua-compat53.hash b/package/lua-compat53/lua-compat53.hash
index f311b9ce8..ce93a67ce 100644
--- a/package/lua-compat53/lua-compat53.hash
+++ b/package/lua-compat53/lua-compat53.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 cb5fdca362780a30405c4134310ea78627a092b0ee8445a52456f2fceeeaea4e  compat53-0.7-1.src.rock
+# computed by luarocks
+md5 e6cce27236b43a0fe31b6229ae57cf7c  compat53-0.7-1.src.rock
+md5 47a1db9761ff46e15d0f65fbc87d4bd5  lua-compat-5.3-0.7/LICENSE
diff --git a/package/lua-csnappy/lua-csnappy.hash b/package/lua-csnappy/lua-csnappy.hash
index f88742644..7d256fbe8 100644
--- a/package/lua-csnappy/lua-csnappy.hash
+++ b/package/lua-csnappy/lua-csnappy.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	4fc373ba714cb8b428e9971f1725d82de6a43dfea361a0b7894e4762238dc95c  lua-csnappy-0.1.5-1.src.rock
+# computed by luarocks
+md5 4d2f3fec9a4e63f384992b046894cf19  lua-csnappy-0.1.5-1.src.rock
+md5 f470d9871cb2583e782bc5125fec91e4  lua-csnappy-0.1.5/COPYRIGHT
diff --git a/package/lua-curl/lua-curl.hash b/package/lua-curl/lua-curl.hash
index e73810ced..d54603f1a 100644
--- a/package/lua-curl/lua-curl.hash
+++ b/package/lua-curl/lua-curl.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 4cc6389bf5d4a868cc1e6017733b9b6306f2fc8b5083aa928d66399195697f34  lua-curl-0.3.7-1.src.rock
+# computed by luarocks
+md5 dd89798ab8b84344a80eaef7ed8ab89c  lua-curl-0.3.7-1.src.rock
+md5 951cb467e86b8c2b65f6de9ac9ad3214  Lua-cURLv3-0.3.7/LICENSE
diff --git a/package/lua-datafile/lua-datafile.hash b/package/lua-datafile/lua-datafile.hash
index 83c346eae..9a89ed68c 100644
--- a/package/lua-datafile/lua-datafile.hash
+++ b/package/lua-datafile/lua-datafile.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 37a33079c3476477f19de14bebd664635a39a57dd05a2709c3a402cbc1e79a6b  datafile-0.4-1.src.rock
+# computed by luarocks
+md5 f39fa2886ed2b0be1f08ff7b6ae4b97a  datafile-0.4-1.src.rock
+md5 d3bf3c07c9585e444c8010120cf66618  datafile/LICENSE
diff --git a/package/lua-fifo/lua-fifo.hash b/package/lua-fifo/lua-fifo.hash
index bab372804..70dd7697a 100644
--- a/package/lua-fifo/lua-fifo.hash
+++ b/package/lua-fifo/lua-fifo.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 53dea24ad658614a0254dcb10296a1a0fc5357315ada5724d6362f54c32b4c20  fifo-0.2-0.src.rock
+# computed by luarocks
+md5 8a50d16daf9ec3348b801d94c0e518cb  fifo-0.2-0.src.rock
+md5 e7717acd0fc60a21abfaba2acb98bf94  fifo.lua-0.2/LICENSE
diff --git a/package/lua-flu/lua-flu.hash b/package/lua-flu/lua-flu.hash
index 92a0a13ff..de524ed24 100644
--- a/package/lua-flu/lua-flu.hash
+++ b/package/lua-flu/lua-flu.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	1389c22daec77161ec93ff90c39ee70e0f8a656ff92f22f9cf5d7121999d5c53  flu-20150331-1.src.rock
+# computed by luarocks
+md5 5c60188bfae6d844d613da785ce56616  flu-20150331-1.src.rock
+md5 dcd8ce8d280f2f7938857a14279b07b2  doub-flu-a7daae986339/doc/LICENSE.txt
diff --git a/package/lua-http/lua-http.hash b/package/lua-http/lua-http.hash
index 2346ab97a..1872b3846 100644
--- a/package/lua-http/lua-http.hash
+++ b/package/lua-http/lua-http.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 d68591eeeeb60c4187469eae89f5bad02d753a8c0adaa460d453b0734222645a  http-0.2-0.src.rock
+# computed by luarocks
+md5 17bbc6374e363fd9653714e0579095eb  http-0.2-0.src.rock
+md5 3f08e3faae9afb8b84fea9a62d0ca54f  lua-http-0.2/LICENSE.md
diff --git a/package/lua-iconv/lua-iconv.hash b/package/lua-iconv/lua-iconv.hash
index 46291026c..1f02184bf 100644
--- a/package/lua-iconv/lua-iconv.hash
+++ b/package/lua-iconv/lua-iconv.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	fb66e785e15376c2d2817f1f1b27d10272b877eacc998c727a10f081a7d768fa  lua-iconv-7-1.src.rock
+# computed by luarocks
+md5 757a4730d00ba5c71aedbeba89048502  lua-iconv-7-1.src.rock
+md5 2703ed4b4fdac99f8e3092bb2f6b7d3e  lua-iconv-7/COPYING
diff --git a/package/lua-lpeg-patterns/lua-lpeg-patterns.hash b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
index f779466df..edf0cb51c 100644
--- a/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
+++ b/package/lua-lpeg-patterns/lua-lpeg-patterns.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 82c8eddee52069e5ae821b68cb9e295ab5767a47d07545a4ca36ac1e81066086  lpeg_patterns-0.4-0.src.rock
+# computed by luarocks
+md5 00b60066af6dda8b3eea5b028fe0f912  lpeg_patterns-0.4-0.src.rock
+md5 d6826f09b61003ecaae3057e5d17061d  lpeg_patterns-0.4/LICENSE.md
diff --git a/package/lua-markdown/lua-markdown.hash b/package/lua-markdown/lua-markdown.hash
index 9bfbf6007..db11a2523 100644
--- a/package/lua-markdown/lua-markdown.hash
+++ b/package/lua-markdown/lua-markdown.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 bed84231bb48322f8e614b4392181c52c36bc71340f9273e0c3bd72dc922bc07  markdown-0.33-1.src.rock
+# computed by luarocks
+md5 1fb152d420e9703cd4f8a834dc6fc616  markdown-0.33-1.src.rock
+md5 2ba696eb6f35a89e58608c6cc3504931  markdown/LICENSE
diff --git a/package/lua-messagepack/lua-messagepack.hash b/package/lua-messagepack/lua-messagepack.hash
index 86ea5d088..2a7f45716 100644
--- a/package/lua-messagepack/lua-messagepack.hash
+++ b/package/lua-messagepack/lua-messagepack.hash
@@ -1,3 +1,3 @@
-# Locally calculated
-sha256 a27d985b8bdb79ebe78dfe255c795e839a04eb2fed1c610a81c7876e3f72fd97  lua-messagepack-0.5.1-1.src.rock
-sha256 b7f69ada6aed7e0cdfd690291607d8f41246e67f191107ecdc0a1e592c449abe  lua-messagepack-lua53-0.5.1-1.src.rock
+# computed by luarocks
+md5 7ada6ff3190349ca221e007d51b72d00  lua-messagepack-0.5.1-1.src.rock
+md5 842c0cbec6e1d6532f3a1a1471753170  lua-MessagePack-0.5.1/COPYRIGHT
diff --git a/package/lua-periphery/lua-periphery.hash b/package/lua-periphery/lua-periphery.hash
index 7f6e63f3b..11368dcf2 100644
--- a/package/lua-periphery/lua-periphery.hash
+++ b/package/lua-periphery/lua-periphery.hash
@@ -1,2 +1,3 @@
-# Locally computed
-sha256  53762ed9b8a2edfcc5b4c535ef73e6a425f2577e036bb15994ca16a39b16ebab  lua-periphery-1.0.6-1.src.rock
+# computed by luarocks
+md5 873a689b7c6a485e1c638a6afeb95c74  lua-periphery-1.0.6-1.src.rock
+md5 e2345d2d9427ddce176381249e2cb9aa  lua-periphery/LICENSE
diff --git a/package/lua-resty-http/lua-resty-http.hash b/package/lua-resty-http/lua-resty-http.hash
index e45df0e91..7a863d359 100644
--- a/package/lua-resty-http/lua-resty-http.hash
+++ b/package/lua-resty-http/lua-resty-http.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 4628413a5a2828645e3ddb38a2a0c764e81443cbd1a011357eeed7e983750329  lua-resty-http-0.12-0.src.rock
+# computed by luarocks
+md5 f7bc05f49ea7a747dea6674a43576709  lua-resty-http-0.12-0.src.rock
+md5 552f8cec37e0043674a5eee6f87bd5bc  lua-resty-http/LICENSE
diff --git a/package/lua-sailor/lua-sailor.hash b/package/lua-sailor/lua-sailor.hash
index f4c42cccc..8c75cc968 100644
--- a/package/lua-sailor/lua-sailor.hash
+++ b/package/lua-sailor/lua-sailor.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 4f7f43a7cf6c62712a521ebaf5f53aaf230039c7fb06480ae168c3aa036120bf  sailor-0.5-4.src.rock
+# computed by luarocks
+md5 dd1f8b748f43f56af9148924417c7c1d  sailor-0.5-4.src.rock
+md5 ddc9faaf81f6b21301596c747338486b  sailor/LICENSE
diff --git a/package/lua-stdlib/lua-stdlib.hash b/package/lua-stdlib/lua-stdlib.hash
index 4882bf1e7..be71c2016 100644
--- a/package/lua-stdlib/lua-stdlib.hash
+++ b/package/lua-stdlib/lua-stdlib.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 b7302ecc8ea3992d3bad96c0c4d56272e38d786d16cc1ad5964fefa73fd7c10b  stdlib-41.2.1-1.src.rock
+# computed by luarocks
+md5 adc52670f44caed221f4f65fd6298252  stdlib-41.2.1-1.src.rock
+md5 97c3f0908c9d2f747338e51da4f3df0a  lua-stdlib-release-v41.2.1/COPYING
diff --git a/package/lua-testmore/lua-testmore.hash b/package/lua-testmore/lua-testmore.hash
index 8db664f2d..bb541754b 100644
--- a/package/lua-testmore/lua-testmore.hash
+++ b/package/lua-testmore/lua-testmore.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	163055ef92df9e01d9ae57cd45d6f6aace1ff4dd3abf7e29b9e30ecb1ab76ae2  lua-testmore-0.3.3-1.src.rock
+# computed by luarocks
+md5 781713a6f67febdcdce70dc4a4bdfba4  lua-testmore-0.3.3-1.src.rock
+md5 121028b998d70efec35ee9623358d3f6  lua-TestMore-0.3.3/COPYRIGHT
diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
index 51fa2439f..989bd6354 100644
--- a/package/lua-utf8/lua-utf8.hash
+++ b/package/lua-utf8/lua-utf8.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256 c9ceb3a9f327b3215cdf959eebf616970b5b0427ca3fde05b19f8236defa4b91  utf8-1.2-0.src.rock
+# computed by luarocks
+md5 84d5689071732925d7c0da006568f1b0  utf8-1.2-0.src.rock
diff --git a/package/lua-valua/lua-valua.hash b/package/lua-valua/lua-valua.hash
index 92ea61311..c71b0123a 100644
--- a/package/lua-valua/lua-valua.hash
+++ b/package/lua-valua/lua-valua.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 bff39692fd2ac3590fd814aa1b1ca33e5d5971092955309aa8424b02b88ce1a3  valua-0.3-1.src.rock
+# computed by luarocks
+md5 3ee360132254f0b4fc3aa9a9930fe849  valua-0.3-1.src.rock
+md5 cad867f2f8bcbcdf80bbfed012d1a16e  valua/LICENSE
diff --git a/package/luabitop/luabitop.hash b/package/luabitop/luabitop.hash
index 78110205a..0d7b32255 100644
--- a/package/luabitop/luabitop.hash
+++ b/package/luabitop/luabitop.hash
@@ -1,2 +1,2 @@
-# Locally calculated
-sha256	fc7a8065a57462ee13bed7f95b0ab13f94ecd1bf846108c61ccf2c75548af26e  luabitop-1.0.2-1.src.rock
+# computed by luarocks
+md5 126e91f2f112680153e2fd227266ab54  luabitop-1.0.2-1.src.rock
diff --git a/package/luacrypto/luacrypto.hash b/package/luacrypto/luacrypto.hash
index 5c577672e..6b4659324 100644
--- a/package/luacrypto/luacrypto.hash
+++ b/package/luacrypto/luacrypto.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	dc935c923b8851208d5d504b343448a9d5bd3e537bb8657875f12d72155600b8  luacrypto-0.3.2-1.src.rock
+# computed by luarocks
+md5 2f71e1c0a50b87956c338659b211693a  luacrypto-0.3.2-1.src.rock
+md5 dbe5147f21d03fac87bc4c601350cd93  luacrypto-0.3.2/COPYING
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.hash b/package/luadbi-sqlite3/luadbi-sqlite3.hash
index bd8b927fa..fb0b17ab1 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.hash
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 2868dad4d189368fcf5cddd191965c8cb2efaa3a3ba83d50e6a88c30353f74ce  luadbi-sqlite3-0.6-2.src.rock
+# computed by luarocks
+md5 fc920a7c5207e7029c62c520d718e368  luadbi-sqlite3-0.6-2.src.rock
+md5 1da46af0ee6257ad1a23725a56389960  luadbi/COPYING
diff --git a/package/luadbi/luadbi.hash b/package/luadbi/luadbi.hash
index e5c022bdf..740123f7c 100644
--- a/package/luadbi/luadbi.hash
+++ b/package/luadbi/luadbi.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 723f63b744b7367ddfd6bbf7a7e6f6867aa1eaabbbc2bab5dc8a90e80b0c34c2  luadbi-0.6-2.src.rock
+# computed by luarocks
+md5 ce3568b15317395cb4440f24759fa991  luadbi-0.6-2.src.rock
+md5 1da46af0ee6257ad1a23725a56389960  luadbi/COPYING
diff --git a/package/luaexpat/luaexpat.hash b/package/luaexpat/luaexpat.hash
index 27f6ed034..10bffc624 100644
--- a/package/luaexpat/luaexpat.hash
+++ b/package/luaexpat/luaexpat.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	aa7883a0d44f500e32ef306c04632546f97f33159fffa7bcdc3f451170f95896  luaexpat-1.3.0-1.src.rock
+# computed by luarocks
+md5 f30aac662213d1b11619da4448e3a9bb  luaexpat-1.3.0-1.src.rock
+md5 9e100888b4a39ac08c37fb127fefc458  luaexpat-1.3.0/doc/us/license.html
diff --git a/package/luafilesystem/luafilesystem.hash b/package/luafilesystem/luafilesystem.hash
index bd4a446cf..e178db83d 100644
--- a/package/luafilesystem/luafilesystem.hash
+++ b/package/luafilesystem/luafilesystem.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 65e6d437e577a1d6cd509b6cd224d2cb9501d58d32a72cafbd4fd3f911681576  luafilesystem-1.7.0-2.src.rock
+# computed by luarocks
+md5 84024d14a71a090f53dee7cd3e3283ed  luafilesystem-1.7.0-2.src.rock
+md5 d9b7e441d51a96b17511ee3be5a75857  luafilesystem/LICENSE
diff --git a/package/luajson/luajson.hash b/package/luajson/luajson.hash
index 36534fe34..3a957d16a 100644
--- a/package/luajson/luajson.hash
+++ b/package/luajson/luajson.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 28a5928cf2e4fd79fa9a9aceaef5ebf1dccb1146489b7de4c2726f561700f01c  luajson-1.3.4-1.src.rock
+# computed by luarocks
+md5 b6cbda5a2ab7b28ce8cecc04f5b6eab6  luajson-1.3.4-1.src.rock
+md5 ac0d9618a43915269abea2cb61c95cac  luajson/LICENSE
diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index 8a6211ec3..08ca04b26 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	6ca3827c4903814626b96011e17ad99b42ecfa983b605aa75bf58f17e90ed58d  lualogging-1.3.0-1.src.rock
+# computed by luarocks
+md5 6a67552c763fda71e90b14a428d719e5  lualogging-1.3.0-1.src.rock
+md5 8cea27c56ce851a51e816051857e2ca5  lualogging/COPYRIGHT
diff --git a/package/luaossl/luaossl.hash b/package/luaossl/luaossl.hash
index 8c91a1fcf..83e345a3d 100644
--- a/package/luaossl/luaossl.hash
+++ b/package/luaossl/luaossl.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 f9c94c97579efddf8abad1e373e0fe0ecc93d00cd9d1bd49f48c5716c281a08b  luaossl-20171028-0.src.rock
+# computed by luarocks
+md5 930f3dfc7bdd1a1a6e7de8ef57de75fa  luaossl-20171028-0.src.rock
+md5 d59d1a970000b257b5b9349f1cac6d6a  luaossl-rel-20171028/LICENSE
diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 1fdbe7d7e..d1d394a25 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	383e183ba712f00b2fcbf60187177432ccde724a23ac6186075ceae620cf0b0a  luasec-0.7-1.src.rock
+# computed by luarocks
+md5 912a9ff2e41bbb1069272f89c33b633e  luasec-0.7-1.src.rock
+md5 c7a82e3ccb7c363b08251ec67db0dcb8  luasec-luasec-0.7/LICENSE
diff --git a/package/luasocket/luasocket.hash b/package/luasocket/luasocket.hash
index ad91f4420..498030ab7 100644
--- a/package/luasocket/luasocket.hash
+++ b/package/luasocket/luasocket.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	453fc1d0e9b6a44bbada4290d565f840a5e96ba2d1b47562ba38bd9c7e82195a  luasocket-3.0rc1-1.src.rock
+# computed by luarocks
+md5 a17724a1feb0a51665804ed5303030fe  luasocket-3.0rc1-1.src.rock
+md5 ab6706baf6d39a6b0fa2613a3b0831e7  luasocket-3.0-rc1/LICENSE
diff --git a/package/luasql-sqlite3/luasql-sqlite3.hash b/package/luasql-sqlite3/luasql-sqlite3.hash
index 5728c8db0..eef0b354c 100644
--- a/package/luasql-sqlite3/luasql-sqlite3.hash
+++ b/package/luasql-sqlite3/luasql-sqlite3.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	e98d4e997682097f5bc2859596b9615f4cb87438db23ceb4af5e36b4424524ab  luasql-sqlite3-2.3.0-1.src.rock
+# computed by luarocks
+md5 261b3ce8f405e82707bc220d58417ea0  luasql-sqlite3-2.3.0-1.src.rock
+md5 053b32e4881dd6d35cf03fba693ecbc4  luasql/doc/us/license.html
diff --git a/package/lunit/lunit.hash b/package/lunit/lunit.hash
index 9c8d53c5e..fb89519af 100644
--- a/package/lunit/lunit.hash
+++ b/package/lunit/lunit.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	b19854c685337ddcec2fe9c22113d2cd14715d52ccd2676abe2fa49b61a2ec4d  lunit-0.5-2.src.rock
+# computed by luarocks
+md5 f88292f9e1b0dbed7dc0d64515a78ea8  lunit-0.5-2.src.rock
+md5 10e51240bd655d081574cb0127437ef4  lunit-0.5/LICENSE
diff --git a/package/orbit/orbit.hash b/package/orbit/orbit.hash
index 9662a650a..9b50e16da 100644
--- a/package/orbit/orbit.hash
+++ b/package/orbit/orbit.hash
@@ -1,2 +1,4 @@
-# Locally calculated
-sha256 91e3c514d5b86918db83666c8889635bb2d50c71d1ab3aeb69c6469c9424089b  orbit-2.2.4-1.src.rock
+# computed by luarocks
+md5 441970222eba0d9bbdd256bd7162a3bf  orbit-2.2.4-1.src.rock
+md5 43b89094d5b8a9fd2d6ed6ef87cd4dbf  orbit/doc/us/license.html
+md5 e7b819e02ac8ba1651c9a81fd0825455  orbit/doc/us/license.md
diff --git a/package/rings/rings.hash b/package/rings/rings.hash
index 59da2fa32..601f38e42 100644
--- a/package/rings/rings.hash
+++ b/package/rings/rings.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256	627ac55d4a420fab766e6870fcd82cb39da12fb4ec8efddc7220b188a4ad4bc3  rings-1.3.0-1.src.rock
+# computed by luarocks
+md5 af4e39a0e760dfa800293b45dbd1134b  rings-1.3.0-1.src.rock
+md5 bae85f5c6caa8b5128a72aff1a108615  rings-v_1_3_0/doc/us/license.html
diff --git a/package/wsapi-fcgi/wsapi-fcgi.hash b/package/wsapi-fcgi/wsapi-fcgi.hash
index f82ce9cfc..a5c8e5024 100644
--- a/package/wsapi-fcgi/wsapi-fcgi.hash
+++ b/package/wsapi-fcgi/wsapi-fcgi.hash
@@ -1,2 +1,4 @@
-# locally computed hash
-sha256 73dc200889bc185953cd3a7c5350c998c090f901fcd10771273b7a63a3ffcdcf  wsapi-fcgi-1.6.1-1.src.rock
+# computed by luarocks
+md5 4360466bf67c140795dc285ab28fc4a3  wsapi-fcgi-1.6.1-1.src.rock
+md5 7c303fa69c61ad25e6a04ef328d650f0  wsapi-1.6.1/doc/us/license.html
+md5 dd5cba6d4f6fa7d9d5241399a0ba0b2d  wsapi-1.6.1/doc/us/license.md
diff --git a/package/wsapi-xavante/wsapi-xavante.hash b/package/wsapi-xavante/wsapi-xavante.hash
index 9e8132df5..662ccf8ab 100644
--- a/package/wsapi-xavante/wsapi-xavante.hash
+++ b/package/wsapi-xavante/wsapi-xavante.hash
@@ -1,2 +1,4 @@
-# locally computed hash
-sha256 b30b171e3d4d6fd7e129f14576e1cfc5adf00c0780ef8350f2f9e6f1d4259346  wsapi-xavante-1.6.1-1.src.rock
+# computed by luarocks
+md5 3dcb6979ffdc0d08276899269b6d407d  wsapi-xavante-1.6.1-1.src.rock
+md5 7c303fa69c61ad25e6a04ef328d650f0  wsapi-1.6.1/doc/us/license.html
+md5 dd5cba6d4f6fa7d9d5241399a0ba0b2d  wsapi-1.6.1/doc/us/license.md
diff --git a/package/wsapi/wsapi.hash b/package/wsapi/wsapi.hash
index 3abbfc979..614aea916 100644
--- a/package/wsapi/wsapi.hash
+++ b/package/wsapi/wsapi.hash
@@ -1,2 +1,4 @@
-# locally computed hash
-sha256 f7f1b0ddc68c257965c42ac7155904d8ff7c2b7256f65ef1b82fda0039137d61 wsapi-1.6.1-1.src.rock
+# computed by luarocks
+md5 d682af244613ab8ea9ae05f2abf0c9f2  wsapi-1.6.1-1.src.rock
+md5 7c303fa69c61ad25e6a04ef328d650f0  wsapi-1.6.1/doc/us/license.html
+md5 dd5cba6d4f6fa7d9d5241399a0ba0b2d  wsapi-1.6.1/doc/us/license.md
diff --git a/package/xavante/xavante.hash b/package/xavante/xavante.hash
index 09b2a22d4..12a17f587 100644
--- a/package/xavante/xavante.hash
+++ b/package/xavante/xavante.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 67c738f981e7d65d18c717f3acac59a37f95d5139c00fb0de5d3167262025273  xavante-2.4.0-1.src.rock
+# computed by luarocks
+md5 c3d0ddd707f7573a68649ce1707a1cb6  xavante-2.4.0-1.src.rock
+md5 156e756c2fa2c64cd432014533a1933e  xavante-2.4.0/doc/us/license.html
-- 
2.17.1
