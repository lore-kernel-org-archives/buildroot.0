From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 14 Jun 2021 19:33:39 +0200
Subject: [Buildroot] [PATCH 2/2] package/tor: bump version to 0.4.6.5
In-Reply-To: <20210614173339.669718-1-bernd.kuhls@t-online.de>
References: <20210614173339.669718-1-bernd.kuhls@t-online.de>
Message-ID: <20210614173339.669718-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://blog.torproject.org/node/2041

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 8622281c2c..800acee2f5 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f304e456102ed26c39e5f16ece2115585398cdb4e67455139c86ea43cdf70856  tor-0.4.5.9.tar.gz
+sha256  7b6d354e0d9791eace4b51e92211909308297b7aa257993937163d7ee0694cf9  tor-0.4.6.5.tar.gz
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index e7e791a10a..e0db278fb9 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.5.9
+TOR_VERSION = 0.4.6.5
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.29.2
