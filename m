From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2020 21:54:08 +0100
Subject: [Buildroot] [git commit] package/tor: bump version to 0.4.2.5
Message-ID: <20200105205311.BC8D18ECBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d40377e4dac228608e6e630caade0549517d16ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://blog.torproject.org/new-release-0425-also-0417-0406-and-0359

Updated license hash due to upstream commit:
https://gitweb.torproject.org/tor.git/commit/LICENSE?h=maint-0.4.2&id=272265efbd89c4c2589316a20cf27064def21911

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 13448de7c6..730bebc8a1 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 2a88524ce426079fb9b828bc1b789f2c8ade3ed53c130851102debc3518bed71  tor-0.4.1.6.tar.gz
-sha256 b4248f32f009d4f5cccb704b351e31a16590e0dd5fda2856382cc854d81f6234  LICENSE
+sha256 4d5975862e7808faebe9960def6235669fafeeac844cb76965501fa7af79d8c2  tor-0.4.2.5.tar.gz
+sha256 ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 264d8d06da..1b493f6993 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.1.6
+TOR_VERSION = 0.4.2.5
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
