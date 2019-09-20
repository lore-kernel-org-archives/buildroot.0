From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Sep 2019 23:07:20 +0200
Subject: [Buildroot] [git commit] package/tor: bump version to 0.4.1.6
Message-ID: <20190920210309.41D4F8ED11@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36079df92f19f61a7cdb20f5350ecf785fc8ec69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://blog.torproject.org/new-release-tor-0416

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 69a49c9057..13448de7c6 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 b5a2cbf0dcd3f1df2675dbd5ec10bbe6f8ae995c41b68cebe2bc95bffc90696e  tor-0.4.0.5.tar.gz
+sha256 2a88524ce426079fb9b828bc1b789f2c8ade3ed53c130851102debc3518bed71  tor-0.4.1.6.tar.gz
 sha256 b4248f32f009d4f5cccb704b351e31a16590e0dd5fda2856382cc854d81f6234  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 6ba204130e..264d8d06da 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.0.5
+TOR_VERSION = 0.4.1.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
