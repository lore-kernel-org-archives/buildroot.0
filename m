From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sun,  2 Feb 2020 20:42:58 +0100
Subject: [Buildroot] [PATCH 08/32] package/h*: add license file hashes
In-Reply-To: <20200202194321.16321-1-heiko.thiery@gmail.com>
References: <20200202194321.16321-1-heiko.thiery@gmail.com>
Message-ID: <20200202194321.16321-9-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/hans/hans.hash                             | 3 ++-
 package/heirloom-mailx/heirloom-mailx.hash         | 2 ++
 package/hicolor-icon-theme/hicolor-icon-theme.hash | 3 ++-
 package/hplip/hplip.hash                           | 1 +
 4 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/hans/hans.hash b/package/hans/hans.hash
index bde6a7ab81..fe46ab5889 100644
--- a/package/hans/hans.hash
+++ b/package/hans/hans.hash
@@ -2,4 +2,5 @@
 md5 8628393ec1b61a6c3a47a0a3dcb455b3  hans-1.0.tar.gz
 sha1 0bc857df109af222732cb95c861a0f0a6dd53dee  hans-1.0.tar.gz
 # Locally computed
-sha256 f8f70cf22ba14d9223695c9e9a2d75289d8360f61f533b83ee538836f29a458e  hans-1.0.tar.gz
+sha256  f8f70cf22ba14d9223695c9e9a2d75289d8360f61f533b83ee538836f29a458e  hans-1.0.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/heirloom-mailx/heirloom-mailx.hash b/package/heirloom-mailx/heirloom-mailx.hash
index 6fc36c9532..1f59f7349d 100644
--- a/package/heirloom-mailx/heirloom-mailx.hash
+++ b/package/heirloom-mailx/heirloom-mailx.hash
@@ -1,2 +1,4 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-3.dsc
 sha256	015ba4209135867f37a0245d22235a392b8bbed956913286b887c2e2a9a421ad	heirloom-mailx_12.5.orig.tar.gz
+# Locally computed
+sha256  5ddc00aed98a0cf75fc7edfd9f3aeb1e919ae0ad5e9ff55d61f643d62d802b07  COPYING
diff --git a/package/hicolor-icon-theme/hicolor-icon-theme.hash b/package/hicolor-icon-theme/hicolor-icon-theme.hash
index 522dcfcd82..b1dcaf4ae8 100644
--- a/package/hicolor-icon-theme/hicolor-icon-theme.hash
+++ b/package/hicolor-icon-theme/hicolor-icon-theme.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	9cc45ac3318c31212ea2d8cb99e64020732393ee7630fa6c1810af5f987033cc	hicolor-icon-theme-0.15.tar.xz
+sha256  9cc45ac3318c31212ea2d8cb99e64020732393ee7630fa6c1810af5f987033cc  hicolor-icon-theme-0.15.tar.xz
+sha256  b0a64377d4ee87b7dbcf418ce4fb33ec3b2d7081b6732890e4af06b8118c4526  COPYING
diff --git a/package/hplip/hplip.hash b/package/hplip/hplip.hash
index 2260850e33..0a4d7eebca 100644
--- a/package/hplip/hplip.hash
+++ b/package/hplip/hplip.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  0f7344174672f63a98a22f3c109005b6eb89fe738b7d466316bf2c53d083476c  hplip-3.17.10.tar.gz
+sha256  8af0e85fc6b88aec25200bcb4f604d886818482bd2c5cc81038f4c6a311c913a  COPYING
-- 
2.20.1
