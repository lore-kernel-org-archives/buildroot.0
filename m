From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:45:36 +0100
Subject: [Buildroot] [git commit] package/n*: add license file hashes
Message-ID: <20200203133730.1178C88723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fd42edb83b982ccf884fa8c14feeb0ad6192f2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nanocom/nanocom.hash                         | 1 +
 package/ncftp/ncftp.hash                             | 3 ++-
 package/ne10/ne10.hash                               | 3 ++-
 package/neard/neard.hash                             | 4 +++-
 package/net-tools/net-tools.hash                     | 3 ++-
 package/netatalk/netatalk.hash                       | 3 +++
 package/netperf/netperf.hash                         | 3 ++-
 package/netplug/netplug.hash                         | 3 ++-
 package/netsniff-ng/netsniff-ng.hash                 | 5 ++++-
 package/netstat-nat/netstat-nat.hash                 | 3 ++-
 package/netsurf-buildsystem/netsurf-buildsystem.hash | 3 ++-
 package/nfacct/nfacct.hash                           | 2 ++
 package/nginx-upload/nginx-upload.hash               | 3 ++-
 package/nload/nload.hash                             | 2 ++
 package/nodm/nodm.hash                               | 3 ++-
 package/noip/noip.hash                               | 3 ++-
 package/ntfs-3g/ntfs-3g.hash                         | 4 +++-
 package/nut/nut.hash                                 | 4 ++++
 package/nuttcp/nuttcp.hash                           | 4 +++-
 19 files changed, 45 insertions(+), 14 deletions(-)

diff --git a/package/nanocom/nanocom.hash b/package/nanocom/nanocom.hash
index 7e7016c25b..df35a37b05 100644
--- a/package/nanocom/nanocom.hash
+++ b/package/nanocom/nanocom.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  5cb26e3e232cfc4a7cb16da432db532b775c5ebdb887ac9d39df5632f2c9a5e5  nanocom.tar.gz
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/ncftp/ncftp.hash b/package/ncftp/ncftp.hash
index f6f7310151..3ab27df5cc 100644
--- a/package/ncftp/ncftp.hash
+++ b/package/ncftp/ncftp.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 129e5954850290da98af012559e6743de193de0012e972ff939df9b604f81c23  ncftp-3.2.6-src.tar.gz
+sha256  129e5954850290da98af012559e6743de193de0012e972ff939df9b604f81c23  ncftp-3.2.6-src.tar.gz
+sha256  4fe2f063d25d79c49712a272ebb68e050c703eed9c66c80108427edfe3285580  doc/LICENSE.txt
diff --git a/package/ne10/ne10.hash b/package/ne10/ne10.hash
index a9635e4011..2c56215c1c 100644
--- a/package/ne10/ne10.hash
+++ b/package/ne10/ne10.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 450dac5bb3a2351019ae23792e97c3bf965d16a21c0598b73cea9fbc3b3a56af  ne10-1.2.0.tar.gz
+sha256  450dac5bb3a2351019ae23792e97c3bf965d16a21c0598b73cea9fbc3b3a56af  ne10-1.2.0.tar.gz
+sha256  eb48041c8e0ad556cf72f2a6eff89c893aa5702bba4e163ca7798cce07e6c55e  doc/LICENSE
diff --git a/package/neard/neard.hash b/package/neard/neard.hash
index d1e74b37bf..948314ddd7 100644
--- a/package/neard/neard.hash
+++ b/package/neard/neard.hash
@@ -1,2 +1,4 @@
 # From https://www.kernel.org/pub/linux/network/nfc/sha256sums.asc
-sha256 eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6ceac9b6e6e65b36  neard-0.16.tar.xz
+sha256  eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6ceac9b6e6e65b36  neard-0.16.tar.xz
+# Locally computed
+sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/net-tools/net-tools.hash b/package/net-tools/net-tools.hash
index 766b6fa031..510cac3659 100644
--- a/package/net-tools/net-tools.hash
+++ b/package/net-tools/net-tools.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 f7cfe9e73825bac9ab1a6f99d1fc7f54bfd9d33a6f62ba58d28a566905c4e86c  net-tools-479bb4a7e11a4084e2935c0a576388f92469225b.tar.gz
+sha256  f7cfe9e73825bac9ab1a6f99d1fc7f54bfd9d33a6f62ba58d28a566905c4e86c  net-tools-479bb4a7e11a4084e2935c0a576388f92469225b.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/netatalk/netatalk.hash b/package/netatalk/netatalk.hash
index 762fcd460e..6c3250a005 100644
--- a/package/netatalk/netatalk.hash
+++ b/package/netatalk/netatalk.hash
@@ -1,3 +1,6 @@
 # From http://sourceforge.net/projects/netatalk/files/netatalk/3.1.12/
 md5 021d2330cb7f7cd2977aec46299dcc1b  netatalk-3.1.12.tar.bz2
 sha1 cc1fe1ebdbdb4da9cf82835c440e82ba28a832c5  netatalk-3.1.12.tar.bz2
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  7599ae145e53be03a08f8b558b2f2e0c828e1630f1843cc04f41981b8cefcd65  COPYRIGHT
diff --git a/package/netperf/netperf.hash b/package/netperf/netperf.hash
index f97274015c..47730855d3 100644
--- a/package/netperf/netperf.hash
+++ b/package/netperf/netperf.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	842af17655835c8be7203808c3393e6cb327a8067f3ed1f1053eb78b4e40375a	netperf-2.7.0.tar.bz2
+sha256  842af17655835c8be7203808c3393e6cb327a8067f3ed1f1053eb78b4e40375a  netperf-2.7.0.tar.bz2
+sha256  dc874b3047b6259336431e813961fb6c5945561c6ad7a732aa8531a3c6b1a9fa  COPYING
diff --git a/package/netplug/netplug.hash b/package/netplug/netplug.hash
index 16a98b7d66..a0d2317a8c 100644
--- a/package/netplug/netplug.hash
+++ b/package/netplug/netplug.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	5180dfd9a7d3d0633a027b0a04f01b45a6a64623813cd48bd54423b90814864e	netplug-1.2.9.2.tar.bz2
+sha256  5180dfd9a7d3d0633a027b0a04f01b45a6a64623813cd48bd54423b90814864e  netplug-1.2.9.2.tar.bz2
+sha256  08ce3ddda499d6befdc80161c7cc82e90da05c31eb1047dae41ef531d5170e9b  COPYING
diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index d44c762660..c9408ccbdb 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking signature
-sha256 7949d38eb5b507700ea0f3c87e9f804d87b43f86ea5de0e961451044c2d3dba2  netsniff-ng-0.6.6.tar.xz
+sha256  7949d38eb5b507700ea0f3c87e9f804d87b43f86ea5de0e961451044c2d3dba2  netsniff-ng-0.6.6.tar.xz
+# Locally computed
+sha256  b353349ba51e0d4b59cf2f188f0c285296e154ce8c58954bc5e0dc0282a4db2d  README
+sha256  8f6d85366f3763557d6ddd0637988b9ba11edef354e3c9302fff4262a235c387  COPYING
diff --git a/package/netstat-nat/netstat-nat.hash b/package/netstat-nat/netstat-nat.hash
index 924da129f7..7530b8a09f 100644
--- a/package/netstat-nat/netstat-nat.hash
+++ b/package/netstat-nat/netstat-nat.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	e945faa283a49f33af15de915a949c9273a230fc17154925364c547adab676ca	netstat-nat-1.4.10.tar.gz
+sha256  e945faa283a49f33af15de915a949c9273a230fc17154925364c547adab676ca  netstat-nat-1.4.10.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.hash b/package/netsurf-buildsystem/netsurf-buildsystem.hash
index c326c28d22..8e3bbabf05 100644
--- a/package/netsurf-buildsystem/netsurf-buildsystem.hash
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 2e2d93e25623761c5de39c8c94750c982335acc1c2da4439b1a2088ecd4455c9  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555.tar.gz
+sha256  2e2d93e25623761c5de39c8c94750c982335acc1c2da4439b1a2088ecd4455c9  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555.tar.gz
+sha256  b2ddc1d607332423f6cf415b2ac619a1c03dd565facdc39a571282a520929a65  llvm/LICENSE.TXT
diff --git a/package/nfacct/nfacct.hash b/package/nfacct/nfacct.hash
index 737354ef3f..d6c05e16d3 100644
--- a/package/nfacct/nfacct.hash
+++ b/package/nfacct/nfacct.hash
@@ -1,3 +1,5 @@
 # From ftp://ftp.netfilter.org/pub/nfacct/nfacct-1.0.2.tar.bz2.{md5sum,sha1sum}
 md5	94faafdaaed85ca9220c5692be8a408e	nfacct-1.0.2.tar.bz2
 sha1	17d6576778227ea93c62600d9b18ff4932963c6a	nfacct-1.0.2.tar.bz2
+# Locally computed
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
diff --git a/package/nginx-upload/nginx-upload.hash b/package/nginx-upload/nginx-upload.hash
index 3a8dfeddf3..ac04626eb0 100644
--- a/package/nginx-upload/nginx-upload.hash
+++ b/package/nginx-upload/nginx-upload.hash
@@ -1,2 +1,3 @@
 #Locally Computed:
-sha256 5f1c3c2b9858b9cacd877a0f2df9b9263734e9cef8d837b73f0e659c0f7fde2d  nginx-upload-70bee48f1811eecd255ed094ce9f0fb560c390c3.tar.gz
+sha256  5f1c3c2b9858b9cacd877a0f2df9b9263734e9cef8d837b73f0e659c0f7fde2d  nginx-upload-70bee48f1811eecd255ed094ce9f0fb560c390c3.tar.gz
+sha256  825f9684c427e29fd1ab085d5c421a4cbf96a460f3c58884a42c28bfbac5e544  LICENCE
diff --git a/package/nload/nload.hash b/package/nload/nload.hash
index 4a8a09d394..f5b8e58f66 100644
--- a/package/nload/nload.hash
+++ b/package/nload/nload.hash
@@ -1,3 +1,5 @@
 # From https://sourceforge.net/projects/nload/files/nload/0.7.4/
 md5	3c733c528f244ca5a4f76bf185729c39	nload-0.7.4.tar.gz
 sha1	bb0a168c93c588ad4fd5e3a653b3620b79ada1e8	nload-0.7.4.tar.gz
+# Locally computed
+sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/nodm/nodm.hash b/package/nodm/nodm.hash
index 2a70c68606..79f16af78c 100644
--- a/package/nodm/nodm.hash
+++ b/package/nodm/nodm.hash
@@ -1,2 +1,3 @@
 # locally calculated
-sha256 ef11667ae82846801a9633df36c20f632cc03319bb1da35f062ac0f950771273  nodm-0.13.tar.gz
+sha256  ef11667ae82846801a9633df36c20f632cc03319bb1da35f062ac0f950771273  nodm-0.13.tar.gz
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/noip/noip.hash b/package/noip/noip.hash
index 166438db48..79b6309da2 100644
--- a/package/noip/noip.hash
+++ b/package/noip/noip.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 82b9bafab96a0c53b21aaef688bf70b3572e26217b5e2072bdb09da3c4a6f593  noip-duc-linux.tar.gz
+sha256  82b9bafab96a0c53b21aaef688bf70b3572e26217b5e2072bdb09da3c4a6f593  noip-duc-linux.tar.gz
+sha256  5aaf7e9e1790c6e372b6c5dec8c6c4b60504414a8c56f64c3071d281d3c251fa  COPYING
diff --git a/package/ntfs-3g/ntfs-3g.hash b/package/ntfs-3g/ntfs-3g.hash
index 2e0b06fd5d..63c999f253 100644
--- a/package/ntfs-3g/ntfs-3g.hash
+++ b/package/ntfs-3g/ntfs-3g.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5  ntfs-3g_ntfsprogs-2017.3.23.tgz
+sha256  3e5a021d7b761261836dcb305370af299793eedbded731df3d6943802e1262d5  ntfs-3g_ntfsprogs-2017.3.23.tgz
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  d7bf9d064ac3e5840f9dd02422b7eeec4f1fd03f37fadbd043602be5e882304f  COPYING.LIB
diff --git a/package/nut/nut.hash b/package/nut/nut.hash
index 870c67cc8e..0a677bc058 100644
--- a/package/nut/nut.hash
+++ b/package/nut/nut.hash
@@ -1,2 +1,6 @@
 # From http://www.networkupstools.org/source/2.7/nut-2.7.2.tar.gz.sha256
 sha256  980e82918c52d364605c0703a5dcf01f74ad2ef06e3d365949e43b7d406d25a7  nut-2.7.4.tar.gz
+# Locally computed
+sha256  9f562d0e6be5108a06684dd249686d378abe1653df14b1944e971e084f6751f0  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE-GPL2
+sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  LICENSE-GPL3
diff --git a/package/nuttcp/nuttcp.hash b/package/nuttcp/nuttcp.hash
index 88310a31d6..c7d0148e12 100644
--- a/package/nuttcp/nuttcp.hash
+++ b/package/nuttcp/nuttcp.hash
@@ -1,2 +1,4 @@
 # From http://lists.freebsd.org/pipermail/freebsd-ports-bugs/2009-August/170685.html
-sha256	054e96d9d68fe917df6f25fab15c7755bdd480f6420d7d48d9194a1a52378169  nuttcp-6.1.2.tar.bz2
+sha256  054e96d9d68fe917df6f25fab15c7755bdd480f6420d7d48d9194a1a52378169  nuttcp-6.1.2.tar.bz2
+# Locally computed
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE
