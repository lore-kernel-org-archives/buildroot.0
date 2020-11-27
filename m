From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Nov 2020 17:48:57 +0100
Subject: [Buildroot] [git commit branch/next] package/lz4: bump version to
 1.9.3
Message-ID: <20201127163445.E7FE781050@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f749946aa802ddc1fa809df98fe9b44279d974ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lz4/lz4.hash | 2 +-
 package/lz4/lz4.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lz4/lz4.hash b/package/lz4/lz4.hash
index 01d0107b3f..0b03089ecd 100644
--- a/package/lz4/lz4.hash
+++ b/package/lz4/lz4.hash
@@ -1,4 +1,4 @@
 # sha256 locally computed
-sha256  658ba6191fa44c92280d4aa2c271b0f4fbc0e34d249578dd05e50e76d0e5efcc  lz4-1.9.2.tar.gz
+sha256  030644df4611007ff7dc962d981f390361e6c97a34e5cbc393ddfbe019ffe2c1  lz4-1.9.3.tar.gz
 sha256  d15d99c8dc6b0ec22174c0e563a95bc40f9363ca7f9d9d793bb5c5a8e8d0af71  lib/LICENSE
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  programs/COPYING
diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index fa309e8dbb..b0510d460b 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZ4_VERSION = 1.9.2
+LZ4_VERSION = 1.9.3
 LZ4_SITE = $(call github,lz4,lz4,v$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2-Clause (library), GPL-2.0+ (programs)
