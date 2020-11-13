From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 13 Nov 2020 07:24:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.4.6
Message-ID: <20201113062450.37070-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://blog.torproject.org/node/1952

Fixes TROVE-2020-005.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index ddf1a880ff..7aa7280f2b 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a45ca00afe765e3baa839767c9dd6ac9a46dd01720a3a8ff4d86558c12359926  tor-0.4.4.5.tar.gz
+sha256  5f154c155803adf5c89e87cab53017b6908c5ebe50c65839e8cf4fbd2abe1fdc  tor-0.4.4.6.tar.gz
 sha256  ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index fe9b52670b..b7095aa39c 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.4.5
+TOR_VERSION = 0.4.4.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.27.0
