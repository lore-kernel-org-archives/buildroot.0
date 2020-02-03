From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:45:35 +0100
Subject: [Buildroot] [git commit] package/lib*: add license file hashes
Message-ID: <20200203133729.F033D88723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=762119b4c5489352a889c2627eb37906647c375d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998 at free.fr: rebase libplist after bump]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freescale-imx/libz160/libz160.hash | 1 +
 package/libcofi/libcofi.hash               | 1 +
 package/libcrossguid/libcrossguid.hash     | 3 ++-
 package/liblockfile/liblockfile.hash       | 6 ++++--
 package/libnet/libnet.hash                 | 2 ++
 package/libplayer/libplayer.hash           | 3 ++-
 package/libplist/libplist.hash             | 3 ++-
 package/libpthsem/libpthsem.hash           | 3 ++-
 package/libreplaygain/libreplaygain.hash   | 4 +++-
 package/librsvg/librsvg.hash               | 2 ++
 package/libserialport/libserialport.hash   | 3 ++-
 package/libsexy/libsexy.hash               | 3 ++-
 package/libshairplay/libshairplay.hash     | 3 ++-
 package/libsidplay2/libsidplay2.hash       | 2 ++
 package/libsoc/libsoc.hash                 | 1 +
 package/libsoil/libsoil.hash               | 4 +++-
 package/libsoundtouch/libsoundtouch.hash   | 3 ++-
 package/libsvg-cairo/libsvg-cairo.hash     | 3 ++-
 package/libsvg/libsvg.hash                 | 3 ++-
 package/libtpl/libtpl.hash                 | 3 ++-
 package/libuecc/libuecc.hash               | 1 +
 package/libuio/libuio.hash                 | 3 ++-
 22 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/package/freescale-imx/libz160/libz160.hash b/package/freescale-imx/libz160/libz160.hash
index ee10630fdf..75f266e3c5 100644
--- a/package/freescale-imx/libz160/libz160.hash
+++ b/package/freescale-imx/libz160/libz160.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  08767eb269a0a30ca0aa3d3b5aa9a53a2d17ed1c24651b7e8cefc7704b883f19  libz160-bin-11.09.01.bin
+sha256  6d7a2fefc2f7ce888f9eb74919b852aed5a1087b2e84345be90cadbebe1b6578  EULA
diff --git a/package/libcofi/libcofi.hash b/package/libcofi/libcofi.hash
index 1baaece4cb..c5f6bb4416 100644
--- a/package/libcofi/libcofi.hash
+++ b/package/libcofi/libcofi.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  72ec89c19267612b316ec9c5835c07212b8f0a377c5b4c20b6e46e69a6e4a5e5  libcofi-7313fbe12b0593034d0a1b606bf33c7cf4ababce.tar.gz
+sha256  1a8203e5d11f0841235cf30265b1ffb19c0d9c4a6d2889554cbeccaf9f09b327  README.md
diff --git a/package/libcrossguid/libcrossguid.hash b/package/libcrossguid/libcrossguid.hash
index a991da56a0..17dbe35c71 100644
--- a/package/libcrossguid/libcrossguid.hash
+++ b/package/libcrossguid/libcrossguid.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 022c9f02cc36e865cd8fd0111a597ff2bd91988deeb348dbe2aba64aed1abd99  libcrossguid-8f399e8bd4252be9952f3dfa8199924cc8487ca4.tar.gz
+sha256  022c9f02cc36e865cd8fd0111a597ff2bd91988deeb348dbe2aba64aed1abd99  libcrossguid-8f399e8bd4252be9952f3dfa8199924cc8487ca4.tar.gz
+sha256  779e58787f966a1552f68d5ec041513cef68785dae4a519dbda7bc0b86eda20e  LICENSE
diff --git a/package/liblockfile/liblockfile.hash b/package/liblockfile/liblockfile.hash
index 4421673b91..881ad992ae 100644
--- a/package/liblockfile/liblockfile.hash
+++ b/package/liblockfile/liblockfile.hash
@@ -1,3 +1,5 @@
 # From http://snapshot.debian.org/archive/debian/20151026T153523Z/pool/main/libl/liblockfile/liblockfile_1.09-6.dsc
-sha256	16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a0695f1b7f	liblockfile_1.09.orig.tar.gz
-sha256	d45eacb7c637c16d03c777c55989d98da494ae9584a0783fe6dbf0db60fa290f	liblockfile_1.09-6.debian.tar.bz2
+sha256  16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a0695f1b7f  liblockfile_1.09.orig.tar.gz
+sha256  d45eacb7c637c16d03c777c55989d98da494ae9584a0783fe6dbf0db60fa290f  liblockfile_1.09-6.debian.tar.bz2
+# Locally computed
+sha256  5fffcc11f94a05a7cff02ff792407737eb1cba840767cc1a71b67fbb19695dd3  COPYRIGHT
diff --git a/package/libnet/libnet.hash b/package/libnet/libnet.hash
index dd3349082d..9f62aeda60 100644
--- a/package/libnet/libnet.hash
+++ b/package/libnet/libnet.hash
@@ -1,3 +1,5 @@
 # From https://sourceforge.net/projects/libnet-dev/files/
 sha1 dffff71c325584fdcf99b80567b60f8ad985e34c libnet-1.1.6.tar.gz
 md5 710296fe424a49344e5fcc0d09e53317 libnet-1.1.6.tar.gz
+# Locally computed
+sha256  961355c8bac6de11ecb8f634111986712e80a88272c0bb0954fd1810e6f47cab  doc/COPYING
diff --git a/package/libplayer/libplayer.hash b/package/libplayer/libplayer.hash
index 6f131433b4..62041e5737 100644
--- a/package/libplayer/libplayer.hash
+++ b/package/libplayer/libplayer.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	aa5eeb54f773bc9cad2733e4a0b5870208fc7f75024515ea87e55f64653e9d65	libplayer-2.0.1.tar.bz2
+sha256  aa5eeb54f773bc9cad2733e4a0b5870208fc7f75024515ea87e55f64653e9d65  libplayer-2.0.1.tar.bz2
+sha256  29bc1d97c09654ba9a9f490e3b69d1bba84938ebb21ac87b2af4d190b082e2ca  COPYING
diff --git a/package/libplist/libplist.hash b/package/libplist/libplist.hash
index 8b36daceab..9934ad05eb 100644
--- a/package/libplist/libplist.hash
+++ b/package/libplist/libplist.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256 4b33f9af3f9208d54a3c3e1a8c149932513f451c98d1dd696fe42c06e30b7f03  libplist-2.1.0.tar.gz
+sha256  4b33f9af3f9208d54a3c3e1a8c149932513f451c98d1dd696fe42c06e30b7f03  libplist-2.1.0.tar.gz
+sha256  7619c753cac95d4740220223bde48a032606fcaccde5e546f9bc444c81ab356d  COPYING
 sha256 7619c753cac95d4740220223bde48a032606fcaccde5e546f9bc444c81ab356d  COPYING
diff --git a/package/libpthsem/libpthsem.hash b/package/libpthsem/libpthsem.hash
index b6aa2b87c5..9da4b88278 100644
--- a/package/libpthsem/libpthsem.hash
+++ b/package/libpthsem/libpthsem.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	4024cafdd5d4bce2b1778a6be5491222c3f6e7ef1e43971264c451c0012c5c01  pthsem_2.0.8.tar.gz
+sha256  4024cafdd5d4bce2b1778a6be5491222c3f6e7ef1e43971264c451c0012c5c01  pthsem_2.0.8.tar.gz
+sha256  f1b95d3728077d1a3efe7fc17928b1953b1224f6caf9c528e30e570158b7520d  COPYING
diff --git a/package/libreplaygain/libreplaygain.hash b/package/libreplaygain/libreplaygain.hash
index 7a6109805a..63e5dca578 100644
--- a/package/libreplaygain/libreplaygain.hash
+++ b/package/libreplaygain/libreplaygain.hash
@@ -1,4 +1,6 @@
 # From https://www.musepack.net/index.php?pg=src
 md5	e27b3b1249b7fbae92d656d9e3d26633	libreplaygain_r475.tar.gz
 # Calculated based on the hash above
-sha256	8258bf785547ac2cda43bb195e07522f0a3682f55abe97753c974609ec232482	libreplaygain_r475.tar.gz
+sha256  8258bf785547ac2cda43bb195e07522f0a3682f55abe97753c974609ec232482  libreplaygain_r475.tar.gz
+# Locally computed
+sha256  511e7b63ce6530b93932d19da3471a6672586339bc131b2699ad4e9b0ee6c9bb  src/gain_analysis.c
diff --git a/package/librsvg/librsvg.hash b/package/librsvg/librsvg.hash
index 6f4b07423a..366d9b0db6 100644
--- a/package/librsvg/librsvg.hash
+++ b/package/librsvg/librsvg.hash
@@ -1,2 +1,4 @@
 # From http://ftp.gnome.org/pub/gnome/sources/librsvg/2.40/librsvg-2.40.20.sha256sum
 sha256	cff4dd3c3b78bfe99d8fcfad3b8ba1eee3289a0823c0e118d78106be6b84c92b	librsvg-2.40.20.tar.xz
+# Locally computed
+sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
diff --git a/package/libserialport/libserialport.hash b/package/libserialport/libserialport.hash
index f2619029a2..39f0c8f1f0 100644
--- a/package/libserialport/libserialport.hash
+++ b/package/libserialport/libserialport.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	4a2af9d9c3ff488e92fb75b4ba38b35bcf9b8a66df04773eba2a7bbf1fa7529d	libserialport-0.1.1.tar.gz
+sha256  4a2af9d9c3ff488e92fb75b4ba38b35bcf9b8a66df04773eba2a7bbf1fa7529d  libserialport-0.1.1.tar.gz
+sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/libsexy/libsexy.hash b/package/libsexy/libsexy.hash
index 78b1a82657..6f47e8ba7c 100644
--- a/package/libsexy/libsexy.hash
+++ b/package/libsexy/libsexy.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	8c4101a8cda5fccbba85ba1a15f46f2cf75deaa8b3c525ce5b135b9e1a8fe49e	libsexy-0.1.11.tar.gz
+sha256  8c4101a8cda5fccbba85ba1a15f46f2cf75deaa8b3c525ce5b135b9e1a8fe49e  libsexy-0.1.11.tar.gz
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/libshairplay/libshairplay.hash b/package/libshairplay/libshairplay.hash
index 19261f98bf..9b12b5a558 100644
--- a/package/libshairplay/libshairplay.hash
+++ b/package/libshairplay/libshairplay.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 49ac0e0470ec6367f720c7b79a09165138f57b60f5949a2d9c38be5823d13294 libshairplay-ce80e005908f41d0e6fde1c4a21e9cb8ee54007b.tar.gz
+sha256  49ac0e0470ec6367f720c7b79a09165138f57b60f5949a2d9c38be5823d13294  libshairplay-ce80e005908f41d0e6fde1c4a21e9cb8ee54007b.tar.gz
+sha256  0ac7d61c52aff5717c02250ca0adf0ef35019e2c0838a3479b8fce597aea6fde  LICENSE
diff --git a/package/libsidplay2/libsidplay2.hash b/package/libsidplay2/libsidplay2.hash
index 1b45cb8781..5342135adf 100644
--- a/package/libsidplay2/libsidplay2.hash
+++ b/package/libsidplay2/libsidplay2.hash
@@ -1,2 +1,4 @@
 # From http://sourceforge.net/projects/sidplay2/files/sidplay2/sidplay-libs-2.1.1/
 sha1	8af6350866edc30b0d331e075fa97292f6f645a5	sidplay-libs-2.1.1.tar.gz
+# Locally computed
+sha256  b8a2f73f743dc1a51aff23f1aacbca4b868564db52496fa3c0caba755bfd1eaf  libsidplay/COPYING
diff --git a/package/libsoc/libsoc.hash b/package/libsoc/libsoc.hash
index 77f2fad79c..2e7c82953c 100644
--- a/package/libsoc/libsoc.hash
+++ b/package/libsoc/libsoc.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  8df626bde365b94a805e1c323104c63a7429ec64c9df815cd1d9b9c4b317e066  libsoc-0.8.2.tar.gz
+sha256  782dafc98788c358fb20e530c8fde3186cdb60f5e18fe6d348fe84ee9f65ddb0  LICENCE
diff --git a/package/libsoil/libsoil.hash b/package/libsoil/libsoil.hash
index 175569b9f6..2596cd6b4d 100644
--- a/package/libsoil/libsoil.hash
+++ b/package/libsoil/libsoil.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256	a2305b8d64f6d636e36d669bbdb0ca5445d1345c754b3d61d3f037dad2e5f701	soil.zip
+sha256  a2305b8d64f6d636e36d669bbdb0ca5445d1345c754b3d61d3f037dad2e5f701  soil.zip
+sha256  a53f0508cafb544aa0b11c241c1000055bd9d827d19712f4de08898e36f29728  src/stb_image_aug.c
+sha256  449ba815b6f610660515246d029f5d08b45178fe8f9f9f520939edad85a7935e  src/image_helper.c
diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index af0c36283a..a79e62f031 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 c805e7a72b7758a8986b71e73d2f94a8c79c66c1246fa2af1743c4282702e096  libsoundtouch-010a91a59071c7fefd316fca62c0d980ec85b4b1.tar.gz
+sha256  c805e7a72b7758a8986b71e73d2f94a8c79c66c1246fa2af1743c4282702e096  libsoundtouch-010a91a59071c7fefd316fca62c0d980ec85b4b1.tar.gz
+sha256  9c6a15d7433078e4c0d3cb9820f172bbf0bf829e7648d719dc85c1429815519b  COPYING.TXT
diff --git a/package/libsvg-cairo/libsvg-cairo.hash b/package/libsvg-cairo/libsvg-cairo.hash
index fba96def72..7240ee57b1 100644
--- a/package/libsvg-cairo/libsvg-cairo.hash
+++ b/package/libsvg-cairo/libsvg-cairo.hash
@@ -2,4 +2,5 @@
 md5 d79da7b3a60ad8c8e4b902c9b3563047  libsvg-cairo-0.1.6.tar.gz
 
 # Locally calculated
-sha256 a380be6a78ec2938100ce904363815a94068fca372c666b8cc82aa8711a0215c libsvg-cairo-0.1.6.tar.gz
+sha256  a380be6a78ec2938100ce904363815a94068fca372c666b8cc82aa8711a0215c  libsvg-cairo-0.1.6.tar.gz
+sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libsvg/libsvg.hash b/package/libsvg/libsvg.hash
index c5008491f1..c314c58015 100644
--- a/package/libsvg/libsvg.hash
+++ b/package/libsvg/libsvg.hash
@@ -2,4 +2,5 @@
 md5 ce0715e3013f78506795fba16e8455d3 libsvg-0.1.4.tar.gz
 
 # Locally calculated
-sha256 4c3bf9292e676a72b12338691be64d0f38cd7f2ea5e8b67fbbf45f1ed404bc8f libsvg-0.1.4.tar.gz
+sha256  4c3bf9292e676a72b12338691be64d0f38cd7f2ea5e8b67fbbf45f1ed404bc8f  libsvg-0.1.4.tar.gz
+sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/libtpl/libtpl.hash b/package/libtpl/libtpl.hash
index 9a455bed97..74ca68fb91 100644
--- a/package/libtpl/libtpl.hash
+++ b/package/libtpl/libtpl.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 0b3750bf62f56be4c42f83c89d8449b24f1c5f1605a104801d70f2f3c06fb2ff  libtpl-1.6.1.tar.gz
+sha256  0b3750bf62f56be4c42f83c89d8449b24f1c5f1605a104801d70f2f3c06fb2ff  libtpl-1.6.1.tar.gz
+sha256  8554ddb5779f1ad2f3ea6db1d0df622e63fca11f44bfc3c8b3c207ea0482c746  LICENSE
diff --git a/package/libuecc/libuecc.hash b/package/libuecc/libuecc.hash
index 67eb5eb572..bfc9aaf396 100644
--- a/package/libuecc/libuecc.hash
+++ b/package/libuecc/libuecc.hash
@@ -2,3 +2,4 @@
 md5     5cd543cb8e7bce83a22c07a0579c95a1                                  libuecc-7.tar.xz
 # computed locally
 sha256  b94aef08eab5359d0facaa7ead2ce81b193eef0c61379d9835213ebc0a46257a  libuecc-7.tar.xz
+sha256  ec4d9fcc3a37a7998a9ea4decf38f4c0c91a44fd05bb17638c52fe16f2b12e23  COPYRIGHT
diff --git a/package/libuio/libuio.hash b/package/libuio/libuio.hash
index ce2f86ee19..54fb02b112 100644
--- a/package/libuio/libuio.hash
+++ b/package/libuio/libuio.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1494375bd493ef1a1b868ce2cbc7d29f3f9f692c21f70689eae28566e56f2c15 libuio-ca28ff0f69d89a789a47552c72db5a43d280710b.tar.gz
+sha256  1494375bd493ef1a1b868ce2cbc7d29f3f9f692c21f70689eae28566e56f2c15  libuio-ca28ff0f69d89a789a47552c72db5a43d280710b.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
