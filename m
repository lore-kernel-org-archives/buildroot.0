From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:43:04 +0100
Subject: [Buildroot] [PATCH 14/32] package/l*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-15-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 linux/linux.hash                                         | 1 +
 package/latencytop/latencytop.hash                       | 1 +
 package/lbase64/lbase64.hash                             | 3 ++-
 package/lbreakout2/lbreakout2.hash                       | 3 ++-
 package/lcdapi/lcdapi.hash                               | 3 ++-
 package/lcdproc/lcdproc.hash                             | 1 +
 package/leafnode2/leafnode2.hash                         | 4 +++-
 package/leafpad/leafpad.hash                             | 4 +++-
 package/lensfun/lensfun.hash                             | 4 +++-
 package/lesstif/lesstif.hash                             | 1 +
 package/let-me-create/let-me-create.hash                 | 3 ++-
 package/linenoise/linenoise.hash                         | 3 ++-
 package/linphone/linphone.hash                           | 4 +++-
 package/linux-backports/linux-backports.hash             | 4 +++-
 package/linux-fusion/linux-fusion.hash                   | 3 ++-
 package/linux-pam/linux-pam.hash                         | 4 +++-
 package/linux-syscall-support/linux-syscall-support.hash | 3 ++-
 package/lirc-tools/lirc-tools.hash                       | 3 ++-
 package/lite/lite.hash                                   | 3 ++-
 package/lksctp-tools/lksctp-tools.hash                   | 3 +++
 package/lmbench/lmbench.hash                             | 2 ++
 package/lockdev/lockdev.hash                             | 6 ++++--
 package/log4cxx/log4cxx.hash                             | 4 +++-
 package/lpc3250loader/lpc3250loader.hash                 | 3 ++-
 package/lrzsz/lrzsz.hash                                 | 3 ++-
 package/lshw/lshw.hash                                   | 3 ++-
 package/lsuio/lsuio.hash                                 | 3 ++-
 package/ltp-testsuite/ltp-testsuite.hash                 | 2 ++
 package/ltrace/ltrace.hash                               | 3 ++-
 package/lua-ev/lua-ev.hash                               | 3 ++-
 package/lua-msgpack-native/lua-msgpack-native.hash       | 1 +
 package/lua-sdl2/lua-sdl2.hash                           | 3 ++-
 package/lua/lua.hash                                     | 2 ++
 package/luabitop/luabitop.hash                           | 4 +++-
 package/luaposix/luaposix.hash                           | 3 ++-
 package/lugaru/lugaru.hash                               | 4 +++-
 package/lutok/lutok.hash                                 | 3 ++-
 37 files changed, 81 insertions(+), 29 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index ddeb7194ce..e198393da7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -8,3 +8,4 @@ sha256 8dbc21f994af9dc3468da4e934a641b457a57cf125d1a8e8f95fe488edd5b5ab  linux-4
 # Locally computed
 sha256 6d60ce76bce2e1938f64027d12b1988c95245751feb635adfc551a021d5b3f26  linux-cip-4.19.88-cip16.tar.gz
 sha256 74ec782e11344e5c5db8e48899b464e296ef37acfb43ce7dfb01c09ea8d3e959  linux-cip-4.19.82-cip14-rt5.tar.gz
+sha256 ee5808b032a67f587d3541099d46de34f5bec8cd5976114ba07f1299ee6001ff  COPYING
diff --git a/package/latencytop/latencytop.hash b/package/latencytop/latencytop.hash
index 4be004cafc..74b8a03a23 100644
--- a/package/latencytop/latencytop.hash
+++ b/package/latencytop/latencytop.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef  latencytop-0.5.tar.gz
+sha256  34d1db30ab21eaedb2c191b2787632a960090a0c63da9f5b481d84b23b98c438  latencytop.c
diff --git a/package/lbase64/lbase64.hash b/package/lbase64/lbase64.hash
index d835d40b25..34ef21324c 100644
--- a/package/lbase64/lbase64.hash
+++ b/package/lbase64/lbase64.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 b83dbc87330a322e5222cd891a6e258b533f5b6c46e8f3c18fc0265e4c991aaa  lbase64.tar.gz
+sha256  b83dbc87330a322e5222cd891a6e258b533f5b6c46e8f3c18fc0265e4c991aaa  lbase64.tar.gz
+sha256  a2b4f2d25b56c40801ce4f403541cbc301313048acfaa59c9509024bec57b662  README
diff --git a/package/lbreakout2/lbreakout2.hash b/package/lbreakout2/lbreakout2.hash
index 0d305dcd73..56d0a9501f 100644
--- a/package/lbreakout2/lbreakout2.hash
+++ b/package/lbreakout2/lbreakout2.hash
@@ -2,4 +2,5 @@
 md5 1a9238b83f9f13f09b7a4d53e00b4e84  lbreakout2-2.6.5.tar.gz
 sha1 d92326499165fd368be04378d633e13d42b4d2d7  lbreakout2-2.6.5.tar.gz
 # Locally computed:
-sha256 9104d6175553da3442dc6a5fc407a669e2f5aff3eedc5d30409eb003b7a78d6f  lbreakout2-2.6.5.tar.gz
+sha256  9104d6175553da3442dc6a5fc407a669e2f5aff3eedc5d30409eb003b7a78d6f  lbreakout2-2.6.5.tar.gz
+sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
diff --git a/package/lcdapi/lcdapi.hash b/package/lcdapi/lcdapi.hash
index 643894e491..fc86b66d0e 100644
--- a/package/lcdapi/lcdapi.hash
+++ b/package/lcdapi/lcdapi.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 6afdd4238af1fa7ea5f10378601381fc3f535a10504dc7d4ea8eab56e0dda091  lcdapi-0.11.tar.gz
+sha256  6afdd4238af1fa7ea5f10378601381fc3f535a10504dc7d4ea8eab56e0dda091  lcdapi-0.11.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lcdproc/lcdproc.hash b/package/lcdproc/lcdproc.hash
index 00f685448d..a90d43c1f2 100644
--- a/package/lcdproc/lcdproc.hash
+++ b/package/lcdproc/lcdproc.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256  843007d377adc856529ed0c7c42c9a7563043f06b1b73add0372bba3a3029804  lcdproc-0.5.7.tar.gz
 sha256  d48a915496c96ff775b377d2222de3150ae5172bfb84a6ec9f9ceab962f97b83  lcdproc-0.5.9.tar.gz
+sha256  1b2a567f289f66a143c56353e7b3d4fa5862514a5e3c5cfdf8b02ee5e5aaa953  COPYING
diff --git a/package/leafnode2/leafnode2.hash b/package/leafnode2/leafnode2.hash
index 9c94fb9ec4..7dfa7cce8d 100644
--- a/package/leafnode2/leafnode2.hash
+++ b/package/leafnode2/leafnode2.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 34eba2cbbb871b724c8d5dd402d1c358aeb21ba426beb5658e155ed0d7461075  leafnode-2.0.0.alpha20140727b.tar.bz2
+sha256  34eba2cbbb871b724c8d5dd402d1c358aeb21ba426beb5658e155ed0d7461075  leafnode-2.0.0.alpha20140727b.tar.bz2
+sha256  59d37f745dc5a2d63a51dff344f4ad89f72e76f8c7b7d877f20880d838b1bec9  COPYING
+sha256  0c92246a9d3636e0aa6a244f6c481639b2e530fbbb25bc048ce7acd83e1fc5f6  COPYING.LGPL
diff --git a/package/leafpad/leafpad.hash b/package/leafpad/leafpad.hash
index be56d41454..e21c07ad2c 100644
--- a/package/leafpad/leafpad.hash
+++ b/package/leafpad/leafpad.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c	leafpad-0.8.18.1.tar.gz
+sha256  959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c  leafpad-0.8.18.1.tar.gz
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/lensfun/lensfun.hash b/package/lensfun/lensfun.hash
index a60f8f4613..1a27373f23 100644
--- a/package/lensfun/lensfun.hash
+++ b/package/lensfun/lensfun.hash
@@ -2,4 +2,6 @@
 sha1 1d978b15aa7304d66a4931fa37ca9f8f89396c16 lensfun-0.3.2.tar.gz
 md5 247e59a0812ec451f6cd0d20b3379cb5 lensfun-0.3.2.tar.gz
 # Locally calculated
-sha256 ae8bcad46614ca47f5bda65b00af4a257a9564a61725df9c74cb260da544d331 lensfun-0.3.2.tar.gz
+sha256  ae8bcad46614ca47f5bda65b00af4a257a9564a61725df9c74cb260da544d331  lensfun-0.3.2.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  docs/gpl-3.0.txt
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  docs/lgpl-3.0.txt
diff --git a/package/lesstif/lesstif.hash b/package/lesstif/lesstif.hash
index c2ede8b6a8..31a394dbbc 100644
--- a/package/lesstif/lesstif.hash
+++ b/package/lesstif/lesstif.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  eb4aa38858c29a4a3bcf605cfe7d91ca41f4522d78d770f69721e6e3a4ecf7e3  lesstif-0.95.2.tar.bz2
+sha256  94b03f1a60a7fd5007149530626a895a6ef5a8b9342abfd56860c5f3956f5d23  COPYING.LIB
diff --git a/package/let-me-create/let-me-create.hash b/package/let-me-create/let-me-create.hash
index 585b0ea3fc..899761786a 100644
--- a/package/let-me-create/let-me-create.hash
+++ b/package/let-me-create/let-me-create.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 5f42858a2062f34d2578e9cb1aed3ccb8d2409d908aa4c41a924418666d5f2bd  let-me-create-1.5.2.tar.gz
+sha256  5f42858a2062f34d2578e9cb1aed3ccb8d2409d908aa4c41a924418666d5f2bd  let-me-create-1.5.2.tar.gz
+sha256  8ffc162e1435e810845b09a4c0d534df057a030f4c107778677b6621dc203426  LICENSE
diff --git a/package/linenoise/linenoise.hash b/package/linenoise/linenoise.hash
index 7837bc68f4..a1cabd9eff 100644
--- a/package/linenoise/linenoise.hash
+++ b/package/linenoise/linenoise.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 f5054a4fe120d43d85427cf58af93e56b9bb80389d507a9bec9b75531a340014  linenoise-1.0.tar.gz
+sha256  f5054a4fe120d43d85427cf58af93e56b9bb80389d507a9bec9b75531a340014  linenoise-1.0.tar.gz
+sha256  efe1692aa5b869edaa0ac88f95eb0276c1125304ffc636a299db3ebbab47f62b  LICENSE
diff --git a/package/linphone/linphone.hash b/package/linphone/linphone.hash
index 9ed9d37f77..e5b9015ae5 100644
--- a/package/linphone/linphone.hash
+++ b/package/linphone/linphone.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	05ba81223e9378c3bce8d33080213b9925af49bd9623cd9004eb3dd22ca9d2a0	linphone-3.6.1.tar.gz
+sha256  05ba81223e9378c3bce8d33080213b9925af49bd9623cd9004eb3dd22ca9d2a0  linphone-3.6.1.tar.gz
+# Locally computed
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/linux-backports/linux-backports.hash b/package/linux-backports/linux-backports.hash
index 38f39b98d5..f39bc2ed27 100644
--- a/package/linux-backports/linux-backports.hash
+++ b/package/linux-backports/linux-backports.hash
@@ -1,2 +1,4 @@
 # From: https://www.kernel.org/pub/linux/kernel/projects/backports/stable/v4.4.2/sha256sums.asc
-sha256 a979e194c2ed9fdfca092a448e626d85c5af0e4de5ad993c0967afd15af01285  backports-4.4.2-1.tar.xz
+sha256  a979e194c2ed9fdfca092a448e626d85c5af0e4de5ad993c0967afd15af01285  backports-4.4.2-1.tar.xz
+# Locally computed
+sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/linux-fusion/linux-fusion.hash b/package/linux-fusion/linux-fusion.hash
index 4bf288d15d..8a90afe2a6 100644
--- a/package/linux-fusion/linux-fusion.hash
+++ b/package/linux-fusion/linux-fusion.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 c3c71af364ef774c70d3f6fbc32d14bc786d915df633d6fe733e1fde84ad6e99 linux-fusion-9.0.3.tar.xz
+sha256  c3c71af364ef774c70d3f6fbc32d14bc786d915df633d6fe733e1fde84ad6e99  linux-fusion-9.0.3.tar.xz
+sha256  51bc14bdef3a064383702e638515824986e5a746de236d46ee904ea15312a198  debian/copyright
diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
index 183bcca401..cfe58ce28e 100644
--- a/package/linux-pam/linux-pam.hash
+++ b/package/linux-pam/linux-pam.hash
@@ -1,4 +1,6 @@
 # Locally computed hashes after checking signature at
 # https://github.com/linux-pam/linux-pam/releases/download/v1.3.1/Linux-PAM-1.3.1.tar.xz.asc
 # signed with the key 8C6BFD92EE0F42EDF91A6A736D1A7F052E5924BB
-sha256 eff47a4ecd833fbf18de9686632a70ee8d0794b79aecb217ebd0ce11db4cd0db  Linux-PAM-1.3.1.tar.xz
+sha256  eff47a4ecd833fbf18de9686632a70ee8d0794b79aecb217ebd0ce11db4cd0db  Linux-PAM-1.3.1.tar.xz
+# Locally computed
+sha256  133d98e7a2ab3ffd330b4debb0bfc10fea21e4b2b5a5b09de2e924293be5ff08  Copyright
diff --git a/package/linux-syscall-support/linux-syscall-support.hash b/package/linux-syscall-support/linux-syscall-support.hash
index 30925522ff..2371dffb12 100644
--- a/package/linux-syscall-support/linux-syscall-support.hash
+++ b/package/linux-syscall-support/linux-syscall-support.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 e5088b81011e30b567b6bde6bb7c22ad529c4ee8890cc5e93d58b21f2c4df56a  linux-syscall-support-3f6478ac95edf86cd3da300c2c0d34a438f5dbeb.tar.gz
+sha256  e5088b81011e30b567b6bde6bb7c22ad529c4ee8890cc5e93d58b21f2c4df56a  linux-syscall-support-3f6478ac95edf86cd3da300c2c0d34a438f5dbeb.tar.gz
+sha256  4c1fc9acc9f3867e5c81b5d5f57c52fb9a932662bd4e2e5e43b3fe95390035f5  linux_syscall_support.h
diff --git a/package/lirc-tools/lirc-tools.hash b/package/lirc-tools/lirc-tools.hash
index ed5ecfde9b..8d9a79d2d1 100644
--- a/package/lirc-tools/lirc-tools.hash
+++ b/package/lirc-tools/lirc-tools.hash
@@ -2,4 +2,5 @@
 sha1 9d6f6d18ac566a96ef4ca1d6909a4e8bc517d48a lirc-0.10.1.tar.bz2
 md5 86c3f8e4efaba10571addb8313d1e040 lirc-0.10.1.tar.bz2
 # Locally computed
-sha256 8b753c60df2a7f5dcda2db72c38e448ca300c3b4f6000c1501fcb0bd5df414f2 lirc-0.10.1.tar.bz2
+sha256  8b753c60df2a7f5dcda2db72c38e448ca300c3b4f6000c1501fcb0bd5df414f2  lirc-0.10.1.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lite/lite.hash b/package/lite/lite.hash
index 9da6b4b6e6..13a494b714 100644
--- a/package/lite/lite.hash
+++ b/package/lite/lite.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	1b784cf595c3d5313e3705db210119f77d48826dbc7fcf6328af83a1270c2264	LiTE-0.8.10.tar.gz
+sha256  1b784cf595c3d5313e3705db210119f77d48826dbc7fcf6328af83a1270c2264  LiTE-0.8.10.tar.gz
+sha256  512d2d21b6b3384ba64781abb0208a1b87740bc31e2df48e2b206ddb7e4d5779  COPYING
diff --git a/package/lksctp-tools/lksctp-tools.hash b/package/lksctp-tools/lksctp-tools.hash
index 0ecc8ff0e2..7c8ef60460 100644
--- a/package/lksctp-tools/lksctp-tools.hash
+++ b/package/lksctp-tools/lksctp-tools.hash
@@ -1,3 +1,6 @@
 # From https://sourceforge.net/projects/lksctp/files/lksctp-tools/
 md5	68e9b8fa4d4e331029b247b72d46d7a5	lksctp-tools-1.0.17.tar.gz
 sha1	941b0b5c39e364a971f514bba66120435660e518	lksctp-tools-1.0.17.tar.gz
+# Locally computed
+sha256  dee5f35e583183abb9212938643ecb2d858fd89e2e286f4b1d903f65d49d6c76  COPYING.lib
+sha256  cc2a6651c315b233ebc110b49ea3c6452eff9a28f8bc051ffd2bb92a8dcfa3d2  COPYING
diff --git a/package/lmbench/lmbench.hash b/package/lmbench/lmbench.hash
index b7aaa6ae56..25c150f4d7 100644
--- a/package/lmbench/lmbench.hash
+++ b/package/lmbench/lmbench.hash
@@ -1,2 +1,4 @@
 # Locally computed:
 sha256  cbd5777d15f44eab7666dcac418054c3c09df99826961a397d9acf43d8a2a551  lmbench-3.0-a9.tgz
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
+sha256  3be7a155efa448db90071a95fbf81796f8f90edf9204f0463cfd23402dc90a72  COPYING-2
diff --git a/package/lockdev/lockdev.hash b/package/lockdev/lockdev.hash
index bb055e4ade..e32466dfe7 100644
--- a/package/lockdev/lockdev.hash
+++ b/package/lockdev/lockdev.hash
@@ -1,3 +1,5 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev/lockdev_1.0.3-1.6.dsc
-sha256	ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82	lockdev_1.0.3.orig.tar.gz
-sha256	a5405c6ee5e97e45eeb1c81330a7e9f444a58bda5e6771fa30007516c115007e	lockdev_1.0.3-1.6.diff.gz
+sha256  ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82  lockdev_1.0.3.orig.tar.gz
+sha256  a5405c6ee5e97e45eeb1c81330a7e9f444a58bda5e6771fa30007516c115007e  lockdev_1.0.3-1.6.diff.gz
+# Locally calculated
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  LICENSE
diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index 469d99af02..90fa2e73d3 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	0de0396220a9566a580166e66b39674cb40efd2176f52ad2c65486c99c920c8c	apache-log4cxx-0.10.0.tar.gz
+sha256  0de0396220a9566a580166e66b39674cb40efd2176f52ad2c65486c99c920c8c  apache-log4cxx-0.10.0.tar.gz
+# Locally computed
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/lpc3250loader/lpc3250loader.hash b/package/lpc3250loader/lpc3250loader.hash
index 4f9dbc4e04..9a27863b25 100644
--- a/package/lpc3250loader/lpc3250loader.hash
+++ b/package/lpc3250loader/lpc3250loader.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 267de7541c92e5b007b93c660a41188976d531a3757f4ffd9b7142d3994da7d1  lpc3250loader-1.0.tar.gz
+sha256  267de7541c92e5b007b93c660a41188976d531a3757f4ffd9b7142d3994da7d1  lpc3250loader-1.0.tar.gz
+sha256  9a817497240e8e92f09ccfec7568a74673dc30ec008b541c8706663677b4e7a9  LPC3250loader.py
diff --git a/package/lrzsz/lrzsz.hash b/package/lrzsz/lrzsz.hash
index 932832d58b..cd8dd6f489 100644
--- a/package/lrzsz/lrzsz.hash
+++ b/package/lrzsz/lrzsz.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1	lrzsz-0.12.20.tar.gz
+sha256  c28b36b14bddb014d9e9c97c52459852f97bd405f89113f30bee45ed92728ff1  lrzsz-0.12.20.tar.gz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/lshw/lshw.hash b/package/lshw/lshw.hash
index 0694229cf5..a8352d4283 100644
--- a/package/lshw/lshw.hash
+++ b/package/lshw/lshw.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	ae22ef11c934364be4fd2a0a1a7aadf4495a0251ec6979da280d342a89ca3c2f	lshw-B.02.18.tar.gz
+sha256  ae22ef11c934364be4fd2a0a1a7aadf4495a0251ec6979da280d342a89ca3c2f  lshw-B.02.18.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lsuio/lsuio.hash b/package/lsuio/lsuio.hash
index d6077af2d4..2df6d074f4 100644
--- a/package/lsuio/lsuio.hash
+++ b/package/lsuio/lsuio.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	c88b3850248b2d3419e025abd7b9b0991c8bd33a2d4983f9608408a29900bfb5	lsuio-0.2.0.tar.gz
+sha256  c88b3850248b2d3419e025abd7b9b0991c8bd33a2d4983f9608408a29900bfb5  lsuio-0.2.0.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 777f06ea56..4f373c0ce4 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,4 @@
 # From: https://github.com/linux-test-project/ltp/releases/download/20200120/ltp-full-20200120.tar.xz.sha1
 sha1 8f622383907e2e64e60b69fd305fecb34311d6b6  ltp-full-20200120.tar.xz
+# Locally computed
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ltrace/ltrace.hash b/package/ltrace/ltrace.hash
index 58a9c6d2af..f795f53bfb 100644
--- a/package/ltrace/ltrace.hash
+++ b/package/ltrace/ltrace.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 894333bb7d347066c4e398d9f4a202af5f2faf80754905dd0e6a2259695baba0  ltrace-c22d359433b333937ee3d803450dc41998115685.tar.gz
+sha256  894333bb7d347066c4e398d9f4a202af5f2faf80754905dd0e6a2259695baba0  ltrace-c22d359433b333937ee3d803450dc41998115685.tar.gz
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/lua-ev/lua-ev.hash b/package/lua-ev/lua-ev.hash
index 3f8d981297..eb4f4cf74c 100644
--- a/package/lua-ev/lua-ev.hash
+++ b/package/lua-ev/lua-ev.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 4e26e05830955fdd882a1b48b535be94356582eea310327f839f830cd9250d3a  lua-ev-339426fbe528f11cb3cd1af69a88f06bba367981.tar.gz
+sha256  4e26e05830955fdd882a1b48b535be94356582eea310327f839f830cd9250d3a  lua-ev-339426fbe528f11cb3cd1af69a88f06bba367981.tar.gz
+sha256  c224cc31feec52e33b621ccdbc245e21316a20a134a4cd8706438a3b3382e8ac  README
diff --git a/package/lua-msgpack-native/lua-msgpack-native.hash b/package/lua-msgpack-native/lua-msgpack-native.hash
index cfc598319d..2a49e9f382 100644
--- a/package/lua-msgpack-native/lua-msgpack-native.hash
+++ b/package/lua-msgpack-native/lua-msgpack-native.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  025cf91d509fa3985869d18ef9b8eaeb875ff3c9fcf6467beeed6eab3bb35c93  lua-msgpack-native-41a91b994c70389dc9daa1a15678741d8ec41749.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/lua-sdl2/lua-sdl2.hash b/package/lua-sdl2/lua-sdl2.hash
index 690ff147e2..e3680a92e2 100644
--- a/package/lua-sdl2/lua-sdl2.hash
+++ b/package/lua-sdl2/lua-sdl2.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	cee7875106062fbc00cf8acb3b2738e336e2327df73ede011968cb060c094bfb  lua-sdl2-2.0.5-6.0.tar.gz
+sha256  cee7875106062fbc00cf8acb3b2738e336e2327df73ede011968cb060c094bfb  lua-sdl2-2.0.5-6.0.tar.gz
+sha256  4f56a5b6943a8ff9611a39e7d4d88dba9ad314dcdf56c62a1425798a6e624494  LICENSE
diff --git a/package/lua/lua.hash b/package/lua/lua.hash
index ba57304d0f..3e7812b7dc 100644
--- a/package/lua/lua.hash
+++ b/package/lua/lua.hash
@@ -4,3 +4,5 @@ sha1 112eb10ff04d1b4c9898e121d6bdf54a81482447  lua-5.3.5.tar.gz
 
 md5 2e115fe26e435e33b0d5c022e4490567           lua-5.1.5.tar.gz
 sha1 b3882111ad02ecc6b972f8c1241647905cb2e3fc  lua-5.1.5.tar.gz
+# Locally computed
+sha256  ee5e3e82af1e1b543c4f216e399d7c8cfee797711913f349e385101c4ae60a79  COPYRIGHT
diff --git a/package/luabitop/luabitop.hash b/package/luabitop/luabitop.hash
index 6f36bd18b7..02757a6b08 100644
--- a/package/luabitop/luabitop.hash
+++ b/package/luabitop/luabitop.hash
@@ -1,2 +1,4 @@
 # computed by luarocks/buildroot
-sha256 fc7a8065a57462ee13bed7f95b0ab13f94ecd1bf846108c61ccf2c75548af26e  luabitop-1.0.2-1.src.rock
+sha256  fc7a8065a57462ee13bed7f95b0ab13f94ecd1bf846108c61ccf2c75548af26e  luabitop-1.0.2-1.src.rock
+# Locally calcuated
+sha256  25e331120d0c2f95fa2ac6e439ca920f0a4362c366a4c7382d843113743a3ba5  LuaBitOp-1.0.2/README
diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index fb06bc40a1..ee72bfe321 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 7948f4ac8b953172e928753632e37ad97cc3014df74b524fe7839f71216a7e90  luaposix-34.1.1.tar.gz
+sha256  7948f4ac8b953172e928753632e37ad97cc3014df74b524fe7839f71216a7e90  luaposix-34.1.1.tar.gz
+sha256  a868e95dd14f832eb63c4580c5fed42d78a6bd11785e3605211f446b05904a18  LICENSE
diff --git a/package/lugaru/lugaru.hash b/package/lugaru/lugaru.hash
index 6ba2bca6ec..a08edb460f 100644
--- a/package/lugaru/lugaru.hash
+++ b/package/lugaru/lugaru.hash
@@ -1,2 +1,4 @@
 # Locally calculated
-sha256 f3ea477caf78911c69939fbdc163f9f6517c7ef2267e716a0e050be1a166ef97 lugaru-1.2.tar.xz
+sha256  f3ea477caf78911c69939fbdc163f9f6517c7ef2267e716a0e050be1a166ef97  lugaru-1.2.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.txt
+sha256  df020520630390de59394235a90a17c5d52d3b80ef76e2edf6d0690cd8b7fd7c  CONTENT-LICENSE.txt
diff --git a/package/lutok/lutok.hash b/package/lutok/lutok.hash
index 0ec8988073..5ae9b1f429 100644
--- a/package/lutok/lutok.hash
+++ b/package/lutok/lutok.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 2cec51efa0c8d65ace8b21eaa08384b77abc5087b46e785f78de1c21fb754cd5 lutok-0.4.tar.gz
+sha256  2cec51efa0c8d65ace8b21eaa08384b77abc5087b46e785f78de1c21fb754cd5  lutok-0.4.tar.gz
+sha256  9343913f8ef8a91ceaf148fdcdb70bb8a45b9df9dac2ef71308053dcb312ade9  COPYING
-- 
2.20.1
