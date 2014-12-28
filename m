From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 22:41:04 +0100
Subject: [Buildroot] [git commit] toolchain-external: add hashes for
	Blackfin toolchains
Message-ID: <20141228214110.7EF0380602@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=10b97618f572b6079f04c5b984686ff7abced72e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those toolchains are downloaded from Sourceforge, and are therefore
affected by the Sourcefoge download issues. Therefore, this commit
adds the hashes for those toolchain tarballs.

Fixes:

  http://autobuild.buildroot.org/results/fa5/fa5e38246dddd661f1d674f3521d21297796bce3/
  (and other similar issues)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external/toolchain-external.hash     |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 7e64d4f..b4fb5e0 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -5,3 +5,12 @@ md5  ad4a66e4791606c5df70f48c4a97b0ec  mips-2014.11-22-mips-linux-gnu-i686-pc-li
 md5  14facaac538a43533b89d969d7904d46  mips-2014.05-27-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
 # From: https://sourcery.mentor.com/GNUToolchain/release2640
 md5  0ba8bc4923c04728ee3787bed4cd5148  mips-2013.11-36-mips-linux-gnu-i686-pc-linux-gnu.tar.bz2
+
+# Blackfin toolchains from Analog Devices
+# Locally computed
+sha256 fba010929c7355a0286fc4b1817d6065ee21380d3c2993383d3778f0b998ca9d  blackfin-toolchain-2012R2-RC2.i386.tar.bz2
+sha256 90284fe72125f381817da505b6f91f2b0c86a763ffe2c722c7d6b3ae60b25010  blackfin-toolchain-2013R1-RC1.i386.tar.bz2
+sha256 e424e90d8481d942a40266d78d1488726561fed3ec38403094f98055e61889d0  blackfin-toolchain-2014R1-RC2.i386.tar.bz2
+sha256 436ca3d901b152094cd6be2b6e274c59643387f46bb0563db1adcab1202f1455  blackfin-toolchain-uclibc-full-2012R2-RC2.i386.tar.bz2
+sha256 4d66a3390ae9e1c4b9aad214757791a5e0c45ef2bb31977fa6d3a80d96290237  blackfin-toolchain-uclibc-full-2013R1-RC1.i386.tar.bz2
+sha256 c65b1b4b918d5185349d62a3b7bf43b4b21e1175c52598ec047ca56b3f11d857  blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
