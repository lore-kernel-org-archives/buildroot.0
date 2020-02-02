From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:09 +0100
Subject: [Buildroot] [PATCH 19/32] package/p*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-20-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/p7zip/p7zip.hash                               | 3 ++-
 package/p910nd/p910nd.hash                             | 1 +
 package/pangomm/pangomm.hash                           | 5 ++++-
 package/pax-utils/pax-utils.hash                       | 3 ++-
 package/paxtest/paxtest.hash                           | 3 ++-
 package/perl-sys-cpu/perl-sys-cpu.hash                 | 3 ++-
 package/php-geoip/php-geoip.hash                       | 3 ++-
 package/php-gnupg/php-gnupg.hash                       | 3 ++-
 package/php-imagick/php-imagick.hash                   | 3 ++-
 package/php-ssh2/php-ssh2.hash                         | 3 ++-
 package/php-zmq/php-zmq.hash                           | 3 ++-
 package/pifmrds/pifmrds.hash                           | 3 ++-
 package/pixz/pixz.hash                                 | 3 ++-
 package/portaudio/portaudio.hash                       | 3 ++-
 package/pps-tools/pps-tools.hash                       | 3 ++-
 package/prboom/prboom.hash                             | 1 +
 package/privoxy/privoxy.hash                           | 2 ++
 package/procrank_linux/procrank_linux.hash             | 3 ++-
 package/proxychains-ng/proxychains-ng.hash             | 1 +
 package/pru-software-support/pru-software-support.hash | 3 ++-
 package/ptpd/ptpd.hash                                 | 1 +
 package/ptpd2/ptpd2.hash                               | 3 ++-
 package/pulseview/pulseview.hash                       | 3 ++-
 23 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/package/p7zip/p7zip.hash b/package/p7zip/p7zip.hash
index b134550eeb..a63a0b4a97 100644
--- a/package/p7zip/p7zip.hash
+++ b/package/p7zip/p7zip.hash
@@ -2,4 +2,5 @@
 md5 a0128d661cfe7cc8c121e73519c54fbf  p7zip_16.02_src_all.tar.bz2
 sha1 e8819907132811aa1afe5ef296181d3a15cc8f22  p7zip_16.02_src_all.tar.bz2
 # Locally computed
-sha256 5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f  p7zip_16.02_src_all.tar.bz2
+sha256  5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f  p7zip_16.02_src_all.tar.bz2
+sha256  555806657dcf0f1e720b581c52643c195ec86ae3f00bd18cc66d2e0f88ffa210  DOC/License.txt
diff --git a/package/p910nd/p910nd.hash b/package/p910nd/p910nd.hash
index 1b952c8e12..93b1389909 100644
--- a/package/p910nd/p910nd.hash
+++ b/package/p910nd/p910nd.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  4ac980a3ae24babae6f70f0a692625ece03a4a92c357fbb10d2e368386c3c26f  p910nd-0.97.tar.bz2
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/pangomm/pangomm.hash b/package/pangomm/pangomm.hash
index b5d527fa7b..bde53e4fbd 100644
--- a/package/pangomm/pangomm.hash
+++ b/package/pangomm/pangomm.hash
@@ -1,2 +1,5 @@
 # From http://ftp.gnome.org/pub/gnome/sources/pangomm/2.40/pangomm-2.40.1.sha256sum
-sha256	9762ee2a2d5781be6797448d4dd2383ce14907159b30bc12bf6b08e7227be3af	pangomm-2.40.1.tar.xz
+sha256  9762ee2a2d5781be6797448d4dd2383ce14907159b30bc12bf6b08e7227be3af  pangomm-2.40.1.tar.xz
+# Locally computed
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/pax-utils/pax-utils.hash b/package/pax-utils/pax-utils.hash
index c755896022..1b4cee4fb8 100644
--- a/package/pax-utils/pax-utils.hash
+++ b/package/pax-utils/pax-utils.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9	pax-utils-1.2.2.tar.xz
+sha256  7f4a7f8db6b4743adde7582fa48992ad01776796fcde030683732f56221337d9  pax-utils-1.2.2.tar.xz
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/paxtest/paxtest.hash b/package/paxtest/paxtest.hash
index c10566c5a7..d9a8caa243 100644
--- a/package/paxtest/paxtest.hash
+++ b/package/paxtest/paxtest.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256	d553848431fd8c2ab6c8361b62e5cedfed1cc1d60088241f4a33d2af15dd667f	paxtest-0.9.15.tar.gz
+sha256  d553848431fd8c2ab6c8361b62e5cedfed1cc1d60088241f4a33d2af15dd667f  paxtest-0.9.15.tar.gz
+sha256  fe8759e6d3ff462c876ded6e95e3fb297d607bc45799bb264ec9a170b5046522  README
diff --git a/package/perl-sys-cpu/perl-sys-cpu.hash b/package/perl-sys-cpu/perl-sys-cpu.hash
index 0977606b1a..896a74109f 100644
--- a/package/perl-sys-cpu/perl-sys-cpu.hash
+++ b/package/perl-sys-cpu/perl-sys-cpu.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256 ca0ec47ab24070e3040e5075337cfc69721362d9bef50f6992072efe644d4d26  Sys-CPU-0.52.tar.gz
+sha256  ca0ec47ab24070e3040e5075337cfc69721362d9bef50f6992072efe644d4d26  Sys-CPU-0.52.tar.gz
+sha256  911a3f8e83dfff143794b34881e13f0759b498c31e067fc7dff0c2e641559e1e  README
diff --git a/package/php-geoip/php-geoip.hash b/package/php-geoip/php-geoip.hash
index 21e26c8ea2..8c99d8ba7a 100644
--- a/package/php-geoip/php-geoip.hash
+++ b/package/php-geoip/php-geoip.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 b2d05c03019d46135c249b5a7fa0dbd43ca5ee98aea8ed807bc7aa90ac8c0f06  geoip-1.1.1.tgz
+sha256  b2d05c03019d46135c249b5a7fa0dbd43ca5ee98aea8ed807bc7aa90ac8c0f06  geoip-1.1.1.tgz
+sha256  93eb7fe81da0861e7013d12fe82cc8691a450822d889c2b0443a434be6c28ef4  geoip.c
diff --git a/package/php-gnupg/php-gnupg.hash b/package/php-gnupg/php-gnupg.hash
index 4185665e04..8d142cdaaf 100644
--- a/package/php-gnupg/php-gnupg.hash
+++ b/package/php-gnupg/php-gnupg.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 35e16bee11345a7d6bf57bea3cadf45e371ad1ed4e0218b0c06f6f637e4e1772  gnupg-1.4.0.tgz
+sha256  35e16bee11345a7d6bf57bea3cadf45e371ad1ed4e0218b0c06f6f637e4e1772  gnupg-1.4.0.tgz
+sha256  da1136d4d9326317cbd320dadddf7e9b4b4edffd973eb083cb7b9754fb6a15d9  LICENSE
diff --git a/package/php-imagick/php-imagick.hash b/package/php-imagick/php-imagick.hash
index abb29d4e20..8b62ed1d9a 100644
--- a/package/php-imagick/php-imagick.hash
+++ b/package/php-imagick/php-imagick.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1f3c5b5eeaa02800ad22f506cd100e8889a66b2ec937e192eaaa30d74562567c  imagick-3.4.3.tgz
+sha256  1f3c5b5eeaa02800ad22f506cd100e8889a66b2ec937e192eaaa30d74562567c  imagick-3.4.3.tgz
+sha256  b6e00df9cb3b91977c0d64a7c4db48cb6f5041f6eeda6583c236775f70a35b78  LICENSE
diff --git a/package/php-ssh2/php-ssh2.hash b/package/php-ssh2/php-ssh2.hash
index f110e77866..36e04f471f 100644
--- a/package/php-ssh2/php-ssh2.hash
+++ b/package/php-ssh2/php-ssh2.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 87618d6a0981afe8c24b36d6b38c21a0aa0237b62e60347d0170bd86b51f79fb  ssh2-1.1.2.tgz
+sha256  87618d6a0981afe8c24b36d6b38c21a0aa0237b62e60347d0170bd86b51f79fb  ssh2-1.1.2.tgz
+sha256  ac7c56f1e416ce6e60abcf26269395128bc9e5a2e4f3293e5dcc124aac606508  LICENSE
diff --git a/package/php-zmq/php-zmq.hash b/package/php-zmq/php-zmq.hash
index c99e351edc..a4cca69878 100644
--- a/package/php-zmq/php-zmq.hash
+++ b/package/php-zmq/php-zmq.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 c492375818bd51b355352798fb94f04d6828c6aeda41ba813849624af74144ce  zmq-1.1.3.tgz
+sha256  c492375818bd51b355352798fb94f04d6828c6aeda41ba813849624af74144ce  zmq-1.1.3.tgz
+sha256  0302303063d3612fc240032aeb6d70e9b7509fc17a4a9edf00eba091ed597514  LICENSE
diff --git a/package/pifmrds/pifmrds.hash b/package/pifmrds/pifmrds.hash
index 0c91d3d449..b0949ca11d 100644
--- a/package/pifmrds/pifmrds.hash
+++ b/package/pifmrds/pifmrds.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 2afc9f3c9fc206ba32865d7dd77f3a97d7d86dcfc9b44eeb5665e8fddaafcf44  pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.tar.gz
+sha256  2afc9f3c9fc206ba32865d7dd77f3a97d7d86dcfc9b44eeb5665e8fddaafcf44  pifmrds-0bf57f9ce0d954365a38d8af8e7be6f28521c3f2.tar.gz
+sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
diff --git a/package/pixz/pixz.hash b/package/pixz/pixz.hash
index 3089bcd90e..5491a016dc 100644
--- a/package/pixz/pixz.hash
+++ b/package/pixz/pixz.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 02c50746b134fa1b1aae41fcc314d7c6f1919b3d48bcdea01bf11769f83f72e8 pixz-1.0.6.tar.xz
+sha256  02c50746b134fa1b1aae41fcc314d7c6f1919b3d48bcdea01bf11769f83f72e8  pixz-1.0.6.tar.xz
+sha256  d036806b4d1efee7c6d86276451c4d833e9798751417e25daae62dfbe348641b  LICENSE
diff --git a/package/portaudio/portaudio.hash b/package/portaudio/portaudio.hash
index ca7baf7fbc..903d760ce0 100644
--- a/package/portaudio/portaudio.hash
+++ b/package/portaudio/portaudio.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	f5a21d7dcd6ee84397446fa1fa1a0675bb2e8a4a6dceb4305a8404698d8d1513	pa_stable_v190600_20161030.tgz
+sha256  f5a21d7dcd6ee84397446fa1fa1a0675bb2e8a4a6dceb4305a8404698d8d1513  pa_stable_v190600_20161030.tgz
+sha256  ec52a1952d701f94e5135719a47376da4ee0b4a0201f1cafb49f61db6480ac3d  LICENSE.txt
diff --git a/package/pps-tools/pps-tools.hash b/package/pps-tools/pps-tools.hash
index 1e54c29463..ee3e4e3d79 100644
--- a/package/pps-tools/pps-tools.hash
+++ b/package/pps-tools/pps-tools.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1168f1474235017af413afdb07288303ad7a7b12a0282f3bf9ed0e22fe0d7d2e  pps-tools-e2b25049df9a4da28168b7378016f1650d0dfa6b.tar.gz
+sha256  1168f1474235017af413afdb07288303ad7a7b12a0282f3bf9ed0e22fe0d7d2e  pps-tools-e2b25049df9a4da28168b7378016f1650d0dfa6b.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/prboom/prboom.hash b/package/prboom/prboom.hash
index 0d80349a61..2cc0f5136f 100644
--- a/package/prboom/prboom.hash
+++ b/package/prboom/prboom.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  226c1c470f8cc983327536404f405a1d026cf0a5188c694a1243cc8630014bae  prboom-2.5.0.tar.gz
+sha256  1cba07ce0f6d1366d84b7cc62b76966ba79075e5f379c1e230c3ff0635fa789f  COPYING
diff --git a/package/privoxy/privoxy.hash b/package/privoxy/privoxy.hash
index 72226b14fc..9cf08f1163 100644
--- a/package/privoxy/privoxy.hash
+++ b/package/privoxy/privoxy.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/ijbswa/files/Sources/3.0.26%20%28stable%29/
 md5 8a1c842112ccea68c19b7ceb4a0e999f  privoxy-3.0.26-stable-src.tar.gz
 sha1 b646624006225979f83453ba542e448667f45998  privoxy-3.0.26-stable-src.tar.gz
+# Locally computed
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/procrank_linux/procrank_linux.hash b/package/procrank_linux/procrank_linux.hash
index b28a8e3683..cc9c403a0e 100644
--- a/package/procrank_linux/procrank_linux.hash
+++ b/package/procrank_linux/procrank_linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1c3592b549b6793b29ab561568f493d0edbfe288ea2aed59afa689eaa26b5d9e procrank_linux-21c30ab4514a5b15ac6e813e21bee0d3d714cb08.tar.gz
+sha256  1c3592b549b6793b29ab561568f493d0edbfe288ea2aed59afa689eaa26b5d9e  procrank_linux-21c30ab4514a5b15ac6e813e21bee0d3d714cb08.tar.gz
+sha256  38751245389e1e23f73e6f5384b5cbe7fa972cc4410c5adc9c04b082a0b9561a  NOTICE
diff --git a/package/proxychains-ng/proxychains-ng.hash b/package/proxychains-ng/proxychains-ng.hash
index 7ca4d5e27a..9781b77af1 100644
--- a/package/proxychains-ng/proxychains-ng.hash
+++ b/package/proxychains-ng/proxychains-ng.hash
@@ -3,3 +3,4 @@ md5 34d840eb184e96bff418201c28a935c5  proxychains-ng-4.11.tar.bz2
 sha1 00bc3dc18f2b638c79112c99f082a7a2878beaad  proxychains-ng-4.11.tar.bz2
 # Locally computed:
 sha256  dcc4149808cd1fb5d9663cc09791f478805816b1f017381f424414c47f6376b6  proxychains-ng-4.11.tar.bz2
+sha256  86728623caeff60e9bcc37e03b432fd191de927eed48a72a3bb4ac4e53fe20df  COPYING
diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index f4ce8e466e..227057126a 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,2 +1,3 @@
 # Locally-calculated hash
-sha256	1e880d74f9a1d04324e6255cb7a0e3d40f92e08809dc81dc6c714447bac5c335	pru-software-support-v5.1.0.tar.gz
+sha256  1e880d74f9a1d04324e6255cb7a0e3d40f92e08809dc81dc6c714447bac5c335  pru-software-support-v5.1.0.tar.gz
+sha256  77a974c14efc315a870a78d8a1021b96c83d316cf9e2ec6fe6a06db3b484e1ed  PRU-Package-v5.0-Manifest.html
diff --git a/package/ptpd/ptpd.hash b/package/ptpd/ptpd.hash
index ccd1d84c31..199f93fc68 100644
--- a/package/ptpd/ptpd.hash
+++ b/package/ptpd/ptpd.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  a7c6ea83bd53da75ae04a7b7a25fe7c597b4e9ff1f93d46f4502e3fa8a2cb950  ptpd-1.1.0.tar.gz
+sha256  be69f30947abef91e0bce161005fe56b116b770e459e3e6980279349de47c366  COPYRIGHT
diff --git a/package/ptpd2/ptpd2.hash b/package/ptpd2/ptpd2.hash
index 0a7379a1d8..b29ce2a0d3 100644
--- a/package/ptpd2/ptpd2.hash
+++ b/package/ptpd2/ptpd2.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256	267ad61d09d97069acec5d4878dceda20d0ddbebd27557d80230847848cee6c2	ptpd2-2.3.1.tar.gz
+sha256  267ad61d09d97069acec5d4878dceda20d0ddbebd27557d80230847848cee6c2  ptpd2-2.3.1.tar.gz
+sha256  5e101ac565a8e74ef4efbf7e0c95ef9333e00618c05dbf5fb4ed50a5bab1ff09  COPYRIGHT
diff --git a/package/pulseview/pulseview.hash b/package/pulseview/pulseview.hash
index 09b9d67bc2..27e27ce1ce 100644
--- a/package/pulseview/pulseview.hash
+++ b/package/pulseview/pulseview.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	9ee7ce3dd1457c6a5f5e4e9c2469903a1f070ba077ea68535cc29ef1dfac6f2f	pulseview-0.4.1.tar.gz
+sha256  9ee7ce3dd1457c6a5f5e4e9c2469903a1f070ba077ea68535cc29ef1dfac6f2f  pulseview-0.4.1.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
-- 
2.20.1
