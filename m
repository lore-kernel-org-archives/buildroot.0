From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 22:46:17 +0100
Subject: [Buildroot] [git commit] package/tor: security bump version to
 0.4.5.7
Message-ID: <20210320212259.B256687826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed308a5cc3cb322eeabdc64a7b468bc3b6cc019e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to upstream commit:
https://gitweb.torproject.org/tor.git/commit/LICENSE?h=tor-0.4.5.7&id=02230575c4da6cd6342516e6682f95dad3e3e29e

Fixes CVE-2021-28089 & CVE-2021-28090.

Release notes: https://blog.torproject.org/node/2009

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index ecbe738574..e46335f79c 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  22cba3794fedd5fa87afc1e512c6ce2c21bc20b4e1c6f8079d832dc1e545e733  tor-0.4.5.6.tar.gz
-sha256  ae2afe6cd3fd9d512afbaa1ef218757eb00aa6b6aa5e2dfc2774b6837e373fa1  LICENSE
+sha256  447fcaaa133e2ef22427e98098a60a9c495edf9ff3e0dd13f484b9ad0185f074  tor-0.4.5.7.tar.gz
+sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 1c9d2f2367..56779f1633 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.5.6
+TOR_VERSION = 0.4.5.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
