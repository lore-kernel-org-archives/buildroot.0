From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:42:59 +0100
Subject: [Buildroot] [PATCH 09/32] package/i*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-10-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/freescale-imx/imx-kobs/imx-kobs.hash       | 4 +++-
 package/freescale-imx/imx-lib/imx-lib.hash         | 3 ++-
 package/i7z/i7z.hash                               | 3 ++-
 package/ibrdtn-tools/ibrdtn-tools.hash             | 3 ++-
 package/ibrdtn/ibrdtn.hash                         | 3 ++-
 package/ibrdtnd/ibrdtnd.hash                       | 3 ++-
 package/ifenslave/ifenslave.hash                   | 4 +++-
 package/ifplugd/ifplugd.hash                       | 3 ++-
 package/iftop/iftop.hash                           | 3 ++-
 package/ifupdown/ifupdown.hash                     | 4 +++-
 package/igh-ethercat/igh-ethercat.hash             | 3 +++
 package/imx-usb-loader/imx-usb-loader.hash         | 1 +
 package/inconsolata/inconsolata.hash               | 4 +++-
 package/input-event-daemon/input-event-daemon.hash | 3 ++-
 package/iodine/iodine.hash                         | 2 ++
 package/iotop/iotop.hash                           | 3 ++-
 package/ipmitool/ipmitool.hash                     | 1 +
 package/iptraf-ng/iptraf-ng.hash                   | 2 ++
 package/irda-utils/irda-utils.hash                 | 1 +
 package/irrlicht/irrlicht.hash                     | 9 +++++++--
 20 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
index 2ede0a9b48..39f02ea04a 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.hash
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -1 +1,3 @@
-sha256	5855c8964f908ad30e5d4500180ee57c51af68186289ef1bdf8553ee60d3b1f5  imx-kobs-a0e9adce2fb7fcd57e794d7f9a5deba0f94f521b.tar.gz
+# Locally computed
+sha256  5855c8964f908ad30e5d4500180ee57c51af68186289ef1bdf8553ee60d3b1f5  imx-kobs-a0e9adce2fb7fcd57e794d7f9a5deba0f94f521b.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index abbf017459..c16dc7f9a9 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256 ced5ad0a179887ef1dd93e8103a9ab7372017cc1c241d28cded164cdece4b918  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57.tar.gz
+sha256  ced5ad0a179887ef1dd93e8103a9ab7372017cc1c241d28cded164cdece4b918  imx-lib-3f777974c0c146817e2ff5cb0340ca66a1f99e57.tar.gz
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING-LGPL-2.1
diff --git a/package/i7z/i7z.hash b/package/i7z/i7z.hash
index 1bcf2c6357..d3affe8dcd 100644
--- a/package/i7z/i7z.hash
+++ b/package/i7z/i7z.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 e127bddf850e7febd39cef2d2b13dca5fe19cc2a1bb1099d72b683be5d8bd1c0 i7z-5023138d7c35c4667c938b853e5ea89737334e92.tar.gz
+sha256  e127bddf850e7febd39cef2d2b13dca5fe19cc2a1bb1099d72b683be5d8bd1c0  i7z-5023138d7c35c4667c938b853e5ea89737334e92.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ibrdtn-tools/ibrdtn-tools.hash b/package/ibrdtn-tools/ibrdtn-tools.hash
index fb77207526..c9fb64cde2 100644
--- a/package/ibrdtn-tools/ibrdtn-tools.hash
+++ b/package/ibrdtn-tools/ibrdtn-tools.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	eab066cf15f9c322d769c6c9c58adfb474cba7d446fd12e8de5ff6344376795b	ibrdtn-tools-1.0.1.tar.gz
+sha256  eab066cf15f9c322d769c6c9c58adfb474cba7d446fd12e8de5ff6344376795b  ibrdtn-tools-1.0.1.tar.gz
+sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  COPYING
diff --git a/package/ibrdtn/ibrdtn.hash b/package/ibrdtn/ibrdtn.hash
index 5f233277c1..0712df1cbc 100644
--- a/package/ibrdtn/ibrdtn.hash
+++ b/package/ibrdtn/ibrdtn.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	  288b14ccbaefb5e3234065c2778c247797ccb3c7afbb6746bb37dc12c620d360	ibrdtn-1.0.1.tar.gz
+sha256  288b14ccbaefb5e3234065c2778c247797ccb3c7afbb6746bb37dc12c620d360  ibrdtn-1.0.1.tar.gz
+sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  COPYING
diff --git a/package/ibrdtnd/ibrdtnd.hash b/package/ibrdtnd/ibrdtnd.hash
index 4b7dd7c3d8..e1438bee3b 100644
--- a/package/ibrdtnd/ibrdtnd.hash
+++ b/package/ibrdtnd/ibrdtnd.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	  9bd79636154093ab6bf4fd10d6c62d67c6db45141460847b19def327c93771ed	ibrdtnd-1.0.1.tar.gz
+sha256  9bd79636154093ab6bf4fd10d6c62d67c6db45141460847b19def327c93771ed  ibrdtnd-1.0.1.tar.gz
+sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  COPYING
diff --git a/package/ifenslave/ifenslave.hash b/package/ifenslave/ifenslave.hash
index dcf31d0904..9073165e7f 100644
--- a/package/ifenslave/ifenslave.hash
+++ b/package/ifenslave/ifenslave.hash
@@ -1,3 +1,5 @@
 # From http://snapshot.debian.org/archive/debian/20170102T091407Z/pool/main/i/ifenslave/ifenslave_2.9.dsc
 sha1 a17e88fa298ef337e872c8aa5d7a390921239d1a   ifenslave_2.9.tar.xz
-sha256  e5666c0b61347bd06f2394c16eca6895fcb5e5cc83d0a1c596a975274de5a3c9    ifenslave_2.9.tar.xz
+sha256  e5666c0b61347bd06f2394c16eca6895fcb5e5cc83d0a1c596a975274de5a3c9  ifenslave_2.9.tar.xz
+# Locally computed
+sha256  299e00f3afc0e6ea0685340df73ad444e58e6fe0229989ba0983f5f33e275c41  debian/copyright
diff --git a/package/ifplugd/ifplugd.hash b/package/ifplugd/ifplugd.hash
index 2977c69aa8..9b720e31c0 100644
--- a/package/ifplugd/ifplugd.hash
+++ b/package/ifplugd/ifplugd.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	474754ac4ab32d738cbf2a4a3e87ee0a2c71b9048a38bdcd7df1e4f9fd6541f0	ifplugd-0.28.tar.gz
+sha256  474754ac4ab32d738cbf2a4a3e87ee0a2c71b9048a38bdcd7df1e4f9fd6541f0  ifplugd-0.28.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  LICENSE
diff --git a/package/iftop/iftop.hash b/package/iftop/iftop.hash
index 19ce66b0a4..3611a6a6ce 100644
--- a/package/iftop/iftop.hash
+++ b/package/iftop/iftop.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	f733eeea371a7577f8fe353d86dd88d16f5b2a2e702bd96f5ffb2c197d9b4f97	iftop-1.0pre4.tar.gz
+sha256  f733eeea371a7577f8fe353d86dd88d16f5b2a2e702bd96f5ffb2c197d9b4f97  iftop-1.0pre4.tar.gz
+sha256  c00d1408e080e7f14615c7c2e0fbd079f1b2c19e93fc6eab819bdee8d5fdfbc4  COPYING
diff --git a/package/ifupdown/ifupdown.hash b/package/ifupdown/ifupdown.hash
index 01353c639b..f8844a60a6 100644
--- a/package/ifupdown/ifupdown.hash
+++ b/package/ifupdown/ifupdown.hash
@@ -1,2 +1,4 @@
 # From http://ftp.de.debian.org/debian/pool/main/i/ifupdown/ifupdown_0.8.16.dsc
-sha256	601416c12e39ac29022951a2867aed5c607f732ac57fd51517bfba92a4cc4fb0	ifupdown_0.8.16.tar.xz
+sha256  601416c12e39ac29022951a2867aed5c607f732ac57fd51517bfba92a4cc4fb0  ifupdown_0.8.16.tar.xz
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index b5ee124aa4..fd373a1407 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,2 +1,5 @@
 # From http://etherlab.org/download/ethercat/ethercat-1.5.2.tar.bz2.md5
 md5	6b4001f8d975865d74a0b108b3bdda3d	ethercat-1.5.2.tar.bz2
+# Locally computed
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/imx-usb-loader/imx-usb-loader.hash b/package/imx-usb-loader/imx-usb-loader.hash
index 149be676d7..182116a25f 100644
--- a/package/imx-usb-loader/imx-usb-loader.hash
+++ b/package/imx-usb-loader/imx-usb-loader.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  5a17886042c09f0f16093031183a287a2a7ae0fa9cd8bdfa31e7b31cb92510d9  imx-usb-loader-4aa9809099dcece9a9225776321f3b4b5b896d78.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/inconsolata/inconsolata.hash b/package/inconsolata/inconsolata.hash
index 49ea958472..d222fc32c6 100644
--- a/package/inconsolata/inconsolata.hash
+++ b/package/inconsolata/inconsolata.hash
@@ -1,2 +1,4 @@
 # From http://snapshot.debian.org/archive/debian/20091207T044352Z/pool/main/t/ttf-inconsolata/ttf-inconsolata_001.010-2.dsc
-sha256	ecf8ba44911fcb3c9683aef1ca2b3cfbafa119a3e93c682f448850e1ae08ce93	ttf-inconsolata_001.010.orig.tar.gz
+sha256  ecf8ba44911fcb3c9683aef1ca2b3cfbafa119a3e93c682f448850e1ae08ce93  ttf-inconsolata_001.010.orig.tar.gz
+# Locally computed
+sha256  8bbed014d1c85a9e3f36703816833c9538e140fea88c2bc3a745ce2449dc18ab  OFL.txt
diff --git a/package/input-event-daemon/input-event-daemon.hash b/package/input-event-daemon/input-event-daemon.hash
index 534dfce639..ad0c4e9913 100644
--- a/package/input-event-daemon/input-event-daemon.hash
+++ b/package/input-event-daemon/input-event-daemon.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 1d9a44160aead88080093f74be9d709fbbc2637f982958e2673d80aedacd0a65  input-event-daemon-0.1.3.tar.gz
+sha256  1d9a44160aead88080093f74be9d709fbbc2637f982958e2673d80aedacd0a65  input-event-daemon-0.1.3.tar.gz
+sha256  56f6614c63a023e4d486332968bfa7933f06ea7c785ef85f403448022ae7f912  README
diff --git a/package/iodine/iodine.hash b/package/iodine/iodine.hash
index 94eb5aa9cc..691ef4d7fb 100644
--- a/package/iodine/iodine.hash
+++ b/package/iodine/iodine.hash
@@ -1,2 +1,4 @@
 # From http://code.kryo.se/iodine/
 md5	fdbf3b81cd69caf5230d76a8b039fd99	iodine-0.7.0.tar.gz
+# Locally computed
+sha256  f41a252b2218759aa351270b7ad9791bdd323836b940e35c0614837a5d24dcb7  README
diff --git a/package/iotop/iotop.hash b/package/iotop/iotop.hash
index b2c497c774..a8e964796e 100644
--- a/package/iotop/iotop.hash
+++ b/package/iotop/iotop.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	1a7c02fd3758bb048d8af861c5f8735eb3ee9abadeaa787f27b8af2b1eaee8ce	iotop-0.6.tar.gz
+sha256  1a7c02fd3758bb048d8af861c5f8735eb3ee9abadeaa787f27b8af2b1eaee8ce  iotop-0.6.tar.gz
+sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index 9b16414801..5c053dc869 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01  ipmitool-1.8.18.tar.bz2
+sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
diff --git a/package/iptraf-ng/iptraf-ng.hash b/package/iptraf-ng/iptraf-ng.hash
index 7cb4d1b137..0a257ec2fd 100644
--- a/package/iptraf-ng/iptraf-ng.hash
+++ b/package/iptraf-ng/iptraf-ng.hash
@@ -1,2 +1,4 @@
 # From https://fedorahosted.org/releases/i/p/iptraf-ng/iptraf-ng-1.1.4.tar.gz.sum
 sha1	a2e51b0dd6b8c80583fc25d055850c96b3d2f544	iptraf-ng-1.1.4.tar.gz
+# Locally computed
+sha256  4e49bef38f621aac4a870da4b30011c7b7abc7256b218daec1c425b08448ae1e  LICENSE
diff --git a/package/irda-utils/irda-utils.hash b/package/irda-utils/irda-utils.hash
index 6a71c47f03..8a513cf312 100644
--- a/package/irda-utils/irda-utils.hash
+++ b/package/irda-utils/irda-utils.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  61980551e46b2eaa9e17ad31cbc1a638074611fc33bff34163d10c7a67a9fdc6  irda-utils-0.9.18.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  man/COPYING
diff --git a/package/irrlicht/irrlicht.hash b/package/irrlicht/irrlicht.hash
index 489790e29b..1f5631f229 100644
--- a/package/irrlicht/irrlicht.hash
+++ b/package/irrlicht/irrlicht.hash
@@ -1,5 +1,10 @@
 # From https://sourceforge.net/projects/irrlicht/files/Irrlicht%20SDK/1.8/1.8.4
 md5 9401cfff801395010b0912211f3cbb4f irrlicht-1.8.4.zip
 sha1 38bf0223fe868d243d6a39d0dc191c8df6e03b3b irrlicht-1.8.4.zip
-# locally calculated
-sha256 f42b280bc608e545b820206fe2a999c55f290de5c7509a02bdbeeccc1bf9e433  irrlicht-1.8.4.zip
+# Locally calculated
+sha256  f42b280bc608e545b820206fe2a999c55f290de5c7509a02bdbeeccc1bf9e433  irrlicht-1.8.4.zip
+sha256  cc86e0b830f9d48933feb198f2741a7d9bb7c34fe8a35302d8ce36b8e2ecb27b  doc/aesGladman.txt
+sha256  e8a6b63336018eec09ac3a7cdfe5a80bda635641bc0397a77b8baa25bed03800  doc/bzip2-license.txt
+sha256  ca38f1ba4ab901111f6eee50009bd46dbd866e6beb98d592d843f7c162d73409  doc/irrlicht-license.txt
+sha256  67f098c29401646a0f52da432efc3bab0433c13f17effc3314e9fa523da51b75  doc/jpglib-license.txt
+sha256  e0f86c3e4acd285618faa55735ceedce46084a3cfb06b8f31d0d092bb68ae151  doc/libpng-license.txt
-- 
2.20.1
