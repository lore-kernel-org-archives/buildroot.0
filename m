From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Feb 2020 14:44:52 +0100
Subject: [Buildroot] [git commit] package/d*: add license file hashes
Message-ID: <20200203133729.7B32188723@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46f16d3f9fd13af06e30874a6a8bd8b790f9d239
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dawgdic/dawgdic.hash                     | 3 ++-
 package/dbus-triggerd/dbus-triggerd.hash         | 3 ++-
 package/dc3dd/dc3dd.hash                         | 3 ++-
 package/dejavu/dejavu.hash                       | 5 ++++-
 package/dillo/dillo.hash                         | 3 ++-
 package/directfb-examples/directfb-examples.hash | 3 ++-
 package/directfb/directfb.hash                   | 3 ++-
 package/dmalloc/dmalloc.hash                     | 3 ++-
 package/dmraid/dmraid.hash                       | 3 +++
 package/docker/docker.hash                       | 4 +++-
 package/dstat/dstat.hash                         | 3 ++-
 package/dtach/dtach.hash                         | 1 +
 package/duma/duma.hash                           | 2 ++
 package/dvbsnoop/dvbsnoop.hash                   | 1 +
 package/dvdauthor/dvdauthor.hash                 | 3 ++-
 package/dvdrw-tools/dvdrw-tools.hash             | 3 ++-
 16 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/package/dawgdic/dawgdic.hash b/package/dawgdic/dawgdic.hash
index da03f0b860..ecf3cf9546 100644
--- a/package/dawgdic/dawgdic.hash
+++ b/package/dawgdic/dawgdic.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 54622a3e79ff3ad2c01a830ec52b997b42ead468b18af5acebab3a4ff32a5ad6  dawgdic-16ac537ba9883ff01b63b6d1fdc3072150c68fee.tar.gz
+sha256  54622a3e79ff3ad2c01a830ec52b997b42ead468b18af5acebab3a4ff32a5ad6  dawgdic-16ac537ba9883ff01b63b6d1fdc3072150c68fee.tar.gz
+sha256  3059f68686f1c5bc6ed0e9db415fc257c4e7618b6ac58ecce83986eb8a7cf501  COPYING
diff --git a/package/dbus-triggerd/dbus-triggerd.hash b/package/dbus-triggerd/dbus-triggerd.hash
index aa4ad97914..b7ed89abf7 100644
--- a/package/dbus-triggerd/dbus-triggerd.hash
+++ b/package/dbus-triggerd/dbus-triggerd.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 3c6d865427bf1b93b16323c796ed6957ce6b2b6fd53f518b1b082d03b939102c  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09.tar.gz
+sha256  3c6d865427bf1b93b16323c796ed6957ce6b2b6fd53f518b1b082d03b939102c  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09.tar.gz
+sha256  30d135650639af9019633690fc1aecbfc150aeeef9446347d4286a58338d10b0  dbus-triggerd.c
diff --git a/package/dc3dd/dc3dd.hash b/package/dc3dd/dc3dd.hash
index 5490d8d3f7..670bffa7a7 100644
--- a/package/dc3dd/dc3dd.hash
+++ b/package/dc3dd/dc3dd.hash
@@ -1,4 +1,5 @@
 # From https://sourceforge.net/projects/dc3dd/files/dc3dd/7.2/
 sha1 1bfe81a921a8473a6ecb46f328ecaab761afb55d dc3dd-7.2.641.tar.xz
 # Locally computed
-sha256 7f50aadc38649845ab11014d11013928411c9d2128c941e9630939d4c28cae6d  dc3dd-7.2.641.tar.xz
+sha256  7f50aadc38649845ab11014d11013928411c9d2128c941e9630939d4c28cae6d  dc3dd-7.2.641.tar.xz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/dejavu/dejavu.hash b/package/dejavu/dejavu.hash
index db7365a1c3..def64cbe87 100644
--- a/package/dejavu/dejavu.hash
+++ b/package/dejavu/dejavu.hash
@@ -1,2 +1,5 @@
 # From https://dejavu-fonts.github.io/Download.html
-sha256 fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7  dejavu-fonts-ttf-2.37.tar.bz2
+sha256  fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7  dejavu-fonts-ttf-2.37.tar.bz2
+
+# locally computed
+sha256  7a083b136e64d064794c3419751e5c7dd10d2f64c108fe5ba161eae5e5958a93  LICENSE
diff --git a/package/dillo/dillo.hash b/package/dillo/dillo.hash
index cab0b14abd..fa46702a63 100644
--- a/package/dillo/dillo.hash
+++ b/package/dillo/dillo.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 db1be16c1c5842ebe07b419aa7c6ef11a45603a75df2877f99635f4f8345148b dillo-3.0.5.tar.bz2
+sha256  db1be16c1c5842ebe07b419aa7c6ef11a45603a75df2877f99635f4f8345148b  dillo-3.0.5.tar.bz2
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/directfb-examples/directfb-examples.hash b/package/directfb-examples/directfb-examples.hash
index 9d59cfef78..9c7f7c25a7 100644
--- a/package/directfb-examples/directfb-examples.hash
+++ b/package/directfb-examples/directfb-examples.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a DirectFB-examples-1.7.0.tar.gz
+sha256  9a2104cc4da8123c8371813551b66b943198979f745cbebc034bb5e10844122a  DirectFB-examples-1.7.0.tar.gz
+sha256  f91483684678e8aa8ccc4ee0ede3140b0494f8305e162695c7e6e3f83e54f236  COPYING
diff --git a/package/directfb/directfb.hash b/package/directfb/directfb.hash
index 069d8c3f1d..f8c4a8303c 100644
--- a/package/directfb/directfb.hash
+++ b/package/directfb/directfb.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 b785c638dc31b8fe3a7c81be1475c89b2255ab3d67b777c747d3fbc52f8027a3 DirectFB-1.7.7.tar.gz
+sha256  b785c638dc31b8fe3a7c81be1475c89b2255ab3d67b777c747d3fbc52f8027a3  DirectFB-1.7.7.tar.gz
+sha256  512d2d21b6b3384ba64781abb0208a1b87740bc31e2df48e2b206ddb7e4d5779  COPYING
diff --git a/package/dmalloc/dmalloc.hash b/package/dmalloc/dmalloc.hash
index e74ef741b9..113751656c 100644
--- a/package/dmalloc/dmalloc.hash
+++ b/package/dmalloc/dmalloc.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 d3be5c6eec24950cb3bd67dbfbcdf036f1278fae5fd78655ef8cdf9e911e428a dmalloc-5.5.2.tgz
+sha256  d3be5c6eec24950cb3bd67dbfbcdf036f1278fae5fd78655ef8cdf9e911e428a  dmalloc-5.5.2.tgz
+sha256  8659d49ceeeb006288ad246164e504ccfe33f7a4c1680439fb6ff6a393b0722b  dmalloc.h.1
diff --git a/package/dmraid/dmraid.hash b/package/dmraid/dmraid.hash
index 31669218e8..af84732f93 100644
--- a/package/dmraid/dmraid.hash
+++ b/package/dmraid/dmraid.hash
@@ -1,2 +1,5 @@
 # From http://people.redhat.com/~heinzm/sw/dmraid/src/dmraid-1.0.0.rc16-3.tar.bz2.md5.sum
 md5	819338fcef98e8e25819f0516722beeb dmraid-1.0.0.rc16-3.tar.bz2
+# locally computed
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  1.0.0.rc16-3/dmraid/LICENSE_GPL
+sha256  4bc391fcf852e03c3a7564cb146af6e47717562eed296b28bce123ee1b0396b8  1.0.0.rc16-3/dmraid/LICENSE
diff --git a/package/docker/docker.hash b/package/docker/docker.hash
index 710a0eb57c..cf0f00e8d8 100644
--- a/package/docker/docker.hash
+++ b/package/docker/docker.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256	47629578e89d96d1541c91d040aec4316f03ad6d01dc3eecb8f82a33445c1e4e	docker-1.5.tar.gz
+sha256  47629578e89d96d1541c91d040aec4316f03ad6d01dc3eecb8f82a33445c1e4e  docker-1.5.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  fd82a1ac93bfe0a5afcf28cfb5342dd02015555fc23529a87bd77a7b271d3262  README
diff --git a/package/dstat/dstat.hash b/package/dstat/dstat.hash
index 1f1f769cc5..603bd506fd 100644
--- a/package/dstat/dstat.hash
+++ b/package/dstat/dstat.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 4fbd58f3461c86d09a3ab97472aa204de37aa33d31a0493a3e5ed86a2045abea  dstat-0.7.4.tar.gz
+sha256  4fbd58f3461c86d09a3ab97472aa204de37aa33d31a0493a3e5ed86a2045abea  dstat-0.7.4.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/dtach/dtach.hash b/package/dtach/dtach.hash
index 5caa58e5c0..1a97aa35ff 100644
--- a/package/dtach/dtach.hash
+++ b/package/dtach/dtach.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  5f7e8c835ee49a9e6dcf89f4e8ccbe724b061c0fc8565b504dd8b3e67ab79f82  dtach-0.9.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/duma/duma.hash b/package/duma/duma.hash
index f664d4033b..ccf171a97c 100644
--- a/package/duma/duma.hash
+++ b/package/duma/duma.hash
@@ -1,2 +1,4 @@
 # Locally computed:
 sha256  baaf794854e3093ad1bddadbfb8ad4b220a7117d70359ee216bd59e353734e17  duma_2_5_15.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING-GPL
+sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING-LGPL
diff --git a/package/dvbsnoop/dvbsnoop.hash b/package/dvbsnoop/dvbsnoop.hash
index 05939f9e31..0d88afe154 100644
--- a/package/dvbsnoop/dvbsnoop.hash
+++ b/package/dvbsnoop/dvbsnoop.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  7658498b26a5d2a0242e81f0cfafa0e43a2bec56f8674e7ac197dfc310866ec6  dvbsnoop-1.4.50.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/dvdauthor/dvdauthor.hash b/package/dvdauthor/dvdauthor.hash
index 36d5d0e686..833884aa9a 100644
--- a/package/dvdauthor/dvdauthor.hash
+++ b/package/dvdauthor/dvdauthor.hash
@@ -2,4 +2,5 @@
 md5 1173dcb8d40e74fc90c0f3a25dbd642d  dvdauthor-0.7.2.tar.gz
 sha1 0e605642140576bfb3e963414d77630d1c073a51  dvdauthor-0.7.2.tar.gz
 # Locally computed
-sha256 3020a92de9f78eb36f48b6f22d5a001c47107826634a785a62dfcd080f612eb7  dvdauthor-0.7.2.tar.gz
+sha256  3020a92de9f78eb36f48b6f22d5a001c47107826634a785a62dfcd080f612eb7  dvdauthor-0.7.2.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/dvdrw-tools/dvdrw-tools.hash b/package/dvdrw-tools/dvdrw-tools.hash
index 17d48f1d1f..a5ed6ad521 100644
--- a/package/dvdrw-tools/dvdrw-tools.hash
+++ b/package/dvdrw-tools/dvdrw-tools.hash
@@ -1,2 +1,3 @@
 # Locally computed using sha256sum
-sha256	f8d60f822e914128bcbc5f64fbe3ed131cbff9045dca7e12c5b77b26edde72ca	dvd+rw-tools-7.1.tar.gz
+sha256  f8d60f822e914128bcbc5f64fbe3ed131cbff9045dca7e12c5b77b26edde72ca  dvd+rw-tools-7.1.tar.gz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  LICENSE
