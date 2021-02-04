From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 22:11:14 +0100
Subject: [Buildroot] [git commit] package/tor: bump version to 0.4.4.7
Message-ID: <20210204205101.8843881DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1f17e24228ccdf238758ec9a4844b5c1847d23e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://blog.torproject.org/node/1990

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 7aa7280f2b..4dd86e51f5 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5f154c155803adf5c89e87cab53017b6908c5ebe50c65839e8cf4fbd2abe1fdc  tor-0.4.4.6.tar.gz
+sha256  326d2926177f0c7838cac213456d0056817d57f3f2e46714a2911c7d7a9b05ee  tor-0.4.4.7.tar.gz
 sha256  ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 098c517aa7..8ad4a7a825 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.4.6
+TOR_VERSION = 0.4.4.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
