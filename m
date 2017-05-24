From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 24 May 2017 17:24:27 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/tor: bump version to 0.3.0.7
Message-ID: <20170524152427.3704-1-bernd.kuhls@t-online.de>
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
index 5b83aa43d..bfdf055f4 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a3e512e93cb555601fd207d914d7c5fe981d66d6ebb5821ecdf5dea738c2fb14  tor-0.3.0.6.tar.gz
+sha256 9640c4448ef3cad7237c68ed6984e705db8fb2b9d6bb74c8815d01bb06527d02  tor-0.3.0.7.tar.gz
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index e6cb2b729..305f6bf40 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.0.6
+TOR_VERSION = 0.3.0.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.11.0
