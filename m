From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:42:53 +0100
Subject: [Buildroot] [PATCH 03/32] package/c*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-4-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/cannelloni/cannelloni.hash         | 1 +
 package/cantarell/cantarell.hash           | 4 +++-
 package/cdrkit/cdrkit.hash                 | 4 +++-
 package/cgroupfs-mount/cgroupfs-mount.hash | 3 ++-
 package/classpath/classpath.hash           | 4 +++-
 package/cppdb/cppdb.hash                   | 3 +++
 package/cramfs/cramfs.hash                 | 1 +
 package/crda/crda.hash                     | 3 ++-
 8 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/package/cannelloni/cannelloni.hash b/package/cannelloni/cannelloni.hash
index c14dceb794..41cb72816d 100644
--- a/package/cannelloni/cannelloni.hash
+++ b/package/cannelloni/cannelloni.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  fe5abb1c9e523049c48dd906603bc762cc55ccd20c16dbec7dc64163b9eefccf  cannelloni-20160414.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  gpl-2.0.txt
diff --git a/package/cantarell/cantarell.hash b/package/cantarell/cantarell.hash
index 330e7869d1..49b4634063 100644
--- a/package/cantarell/cantarell.hash
+++ b/package/cantarell/cantarell.hash
@@ -1,2 +1,4 @@
 # From http://ftp.acc.umu.se/pub/gnome/sources/cantarell-fonts/0.0/cantarell-fonts-0.0.25.sha256sum
-sha256	14a228aa0b516dfc367b434a850f955a00c57fc549cbb05348e2b150196a737f	cantarell-fonts-0.0.25.tar.xz
+sha256  14a228aa0b516dfc367b434a850f955a00c57fc549cbb05348e2b150196a737f  cantarell-fonts-0.0.25.tar.xz
+# locally computed
+sha256  79a9d6198c0d9192c1b0bf55bcbc404a39390bd0d8c650cf20d652c2eaa284d8  COPYING
diff --git a/package/cdrkit/cdrkit.hash b/package/cdrkit/cdrkit.hash
index 6ecb922df6..8b574c7079 100644
--- a/package/cdrkit/cdrkit.hash
+++ b/package/cdrkit/cdrkit.hash
@@ -1,2 +1,4 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit/cdrkit_1.1.11-3.dsc
-sha256	d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da	cdrkit_1.1.11.orig.tar.gz
+sha256  d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da  cdrkit_1.1.11.orig.tar.gz
+# locally computed
+sha256  90daae00475a992a367da5b0658469a5d1c4449dbbe964c5b7246e1aec92f491  COPYING
diff --git a/package/cgroupfs-mount/cgroupfs-mount.hash b/package/cgroupfs-mount/cgroupfs-mount.hash
index 926a031d75..dc103646a8 100644
--- a/package/cgroupfs-mount/cgroupfs-mount.hash
+++ b/package/cgroupfs-mount/cgroupfs-mount.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 d6c8aff7af59c7d0082ee3018c97f73b0421e81a49bb28ad9f66a36da5cd6ec7  cgroupfs-mount-1.4.tar.gz
+sha256  d6c8aff7af59c7d0082ee3018c97f73b0421e81a49bb28ad9f66a36da5cd6ec7  cgroupfs-mount-1.4.tar.gz
+sha256  e52f47a650734f70c40c8fd9318f85e42777bf3fba7ff1dfb72f845bb417f7e6  debian/copyright
diff --git a/package/classpath/classpath.hash b/package/classpath/classpath.hash
index d1c5b5c1a4..98a7f1eab0 100644
--- a/package/classpath/classpath.hash
+++ b/package/classpath/classpath.hash
@@ -1,2 +1,4 @@
 # From https://www.gnu.org/software/classpath/announce/20120307.html
-sha256	f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8	classpath-0.99.tar.gz
+sha256  f929297f8ae9b613a1a167e231566861893260651d913ad9b6c11933895fecc8  classpath-0.99.tar.gz
+# locally computed
+sha256  357bd31f17c7869a73cd159e46b3dafa2bbf434f022085a820c1f68d941a0b4c  COPYING
diff --git a/package/cppdb/cppdb.hash b/package/cppdb/cppdb.hash
index efc0eac0df..6423ef289e 100644
--- a/package/cppdb/cppdb.hash
+++ b/package/cppdb/cppdb.hash
@@ -1,3 +1,6 @@
 # From http://sourceforge.net/projects/cppcms/files/cppdb/0.3.1/
 md5	129f1d75f46114b79160b93807d5223f	cppdb-0.3.1.tar.bz2
 sha1	c0410dcc482d71696ac9206044b3a3ac03d31f96	cppdb-0.3.1.tar.bz2
+# locally computed
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE_1_0.txt
+sha256  503ed52ef942d44bb26bd47dd5c6765927b198624e4f375e32cc660dfc2a0981  MIT.txt
diff --git a/package/cramfs/cramfs.hash b/package/cramfs/cramfs.hash
index c6c18b073c..af7d2e1db3 100644
--- a/package/cramfs/cramfs.hash
+++ b/package/cramfs/cramfs.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  99d87aa5874f4a34c219275e0297b0f4c710895f9c87295267aeabe6a752add1  cramfs-1a1e65f2a049.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/crda/crda.hash b/package/crda/crda.hash
index edec55a019..2a263d172a 100644
--- a/package/crda/crda.hash
+++ b/package/crda/crda.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 5a8f35bb8b27474f466b0e75d451ba917433d8aab1889678a64d9c4e72a8b8c2 crda-4.14.tar.gz
+sha256  5a8f35bb8b27474f466b0e75d451ba917433d8aab1889678a64d9c4e72a8b8c2  crda-4.14.tar.gz
+sha256  c16224b376128b589eea69a8fdd1f09818b8cb995e10d1e37f72dff22233d7b0  LICENSE
-- 
2.20.1
