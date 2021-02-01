From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2021 18:25:46 +0100
Subject: [Buildroot] [git commit] package/binutils: bump 2.35.x series to
 2.35.2
Message-ID: <20210201170854.49CC5814AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98267eb8740085f7e5104a6cf62b0b8d3c5dd377
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:

  https://sourceware.org/pipermail/binutils/2021-January/115150.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/{2.35.1 => 2.35.2}/0001-sh-conf.patch                | 0
 .../binutils/{2.35.1 => 2.35.2}/0002-poison-system-directories.patch  | 0
 package/binutils/Config.in.host                                       | 4 ++--
 package/binutils/binutils.hash                                        | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/binutils/2.35.1/0001-sh-conf.patch b/package/binutils/2.35.2/0001-sh-conf.patch
similarity index 100%
rename from package/binutils/2.35.1/0001-sh-conf.patch
rename to package/binutils/2.35.2/0001-sh-conf.patch
diff --git a/package/binutils/2.35.1/0002-poison-system-directories.patch b/package/binutils/2.35.2/0002-poison-system-directories.patch
similarity index 100%
rename from package/binutils/2.35.1/0002-poison-system-directories.patch
rename to package/binutils/2.35.2/0002-poison-system-directories.patch
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 89c6894a1f..49daf3b70a 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -32,7 +32,7 @@ config BR2_BINUTILS_VERSION_2_34_X
 	depends on !BR2_BINFMT_FLAT
 
 config BR2_BINUTILS_VERSION_2_35_X
-	bool "binutils 2.35.1"
+	bool "binutils 2.35.2"
 	depends on !BR2_csky
 	# https://github.com/uclinux-dev/elf2flt/pull/16
 	# https://github.com/uclinux-dev/elf2flt/issues/12
@@ -55,7 +55,7 @@ config BR2_BINUTILS_VERSION
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
 	default "2.33.1"	if BR2_BINUTILS_VERSION_2_33_X
 	default "2.34"		if BR2_BINUTILS_VERSION_2_34_X
-	default "2.35.1"	if BR2_BINUTILS_VERSION_2_35_X
+	default "2.35.2"	if BR2_BINUTILS_VERSION_2_35_X
 
 config BR2_BINUTILS_ENABLE_LTO
 	bool
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index ce5b0cdca8..ff91e802cc 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -2,7 +2,7 @@
 sha512  d326408f12a03d9a61a9de56584c2af12f81c2e50d2d7e835d51565df8314df01575724afa1e43bd0db45cfc9916b41519b67dfce03232aa4978704492a6994a  binutils-2.32.tar.xz
 sha512  b7a6767c6c7ca6b5cafa7080e6820b7bb3a53b7148348c438d99905defbdf0d30c9744a484ee01c9441a8153901808513366b15ba9533e20c9673c262ade36ac  binutils-2.33.1.tar.xz
 sha512  2c7976939dcf5e8c5b7374cccd39bfe803b1bec73c6abfa0eb17c24e1942574c6bdb874c66a092a82adc443182eacd8a5a8001c19a76101f0c7ba40c27de0bbd  binutils-2.34.tar.xz
-sha512  94ff72708403413b70b247f3af4099ebaa882b6659249869f1ed9941a0f1912e313f08357d470f9fd2359e7f5e5b0eb86285e5eaf883fa8187789d6b1bd304eb  binutils-2.35.1.tar.xz
+sha512  9974ede5978d32e0d68fef23da48fa00bd06b0bff7ec45b00ca075c126d6bbe0cf2defc03ecc3f17bc6cc85b64271a13009c4049d7ba17de26e84e3a6e2c0348  binutils-2.35.2.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
