From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Oct 2017 08:57:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.3.1.8
Message-ID: <20171028065729.10771-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://blog.torproject.org/new-stable-tor-releases-0318-03012-02913-02816-02515

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 3 ++-
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index fb8ddd0c0a..cf8841aecf 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 1df5dd4894bb2f5e0dc96c466955146353cf33ac50cd997cfc1b28ea3ed9c08f  tor-0.3.1.7.tar.gz
+sha256 7df6298860a59f410ff8829cf7905a50c8b3a9094d51a8553603b401e4b5b1a1  tor-0.3.1.8.tar.gz
+sha256 f9a4f724d8037711dde7d3f1d17094fb7d211545b3a3bbb1b03e769e13ca5608  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 7bce9d1b40..a069651b1c 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.1.7
+TOR_VERSION = 0.3.1.8
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.11.0
