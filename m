From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 22:48:45 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/tor: security
 bump version to 0.4.4.8
Message-ID: <20210326220819.BC86E87A9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3359de91b02aef5c9500a84d6ded588ac3d231bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Updated license hash due to upstream commit:
https://gitweb.torproject.org/tor.git/commit/LICENSE?h=tor-0.4.4.8&id=02230575c4da6cd6342516e6682f95dad3e3e29e

Fixes CVE-2021-28089 & CVE-2021-28090.

Release notes: https://blog.torproject.org/node/2009

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 7aa7280f2b..a383704033 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5f154c155803adf5c89e87cab53017b6908c5ebe50c65839e8cf4fbd2abe1fdc  tor-0.4.4.6.tar.gz
-sha256  ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
+sha256  4cad1638d22d47f4877da44f85d655205a069464a02d2f2a2d20f08756cb7547  tor-0.4.4.8.tar.gz
+sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index b7095aa39c..bcfd2f4550 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.4.6
+TOR_VERSION = 0.4.4.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
