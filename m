From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Aug 2015 17:12:48 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/tor: bump version to 0.2.6.10
In-Reply-To: <1439133168-13800-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439133168-13800-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439133168-13800-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 341a611..637efe4 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	4a6c29ad89a98d7832c599d9480d6d8e55355fb3b8f4b506c5df557f15942f9c  tor-0.2.6.9.tar.gz
+sha256	0542c0efe43b86619337862fa7eb02c7a74cb23a79d587090628a5f0f1224b8d	tor-0.2.6.10.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index a464391..7db0964 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.2.6.9
+TOR_VERSION = 0.2.6.10
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3c
 TOR_LICENSE_FILES = LICENSE
-- 
2.1.4
