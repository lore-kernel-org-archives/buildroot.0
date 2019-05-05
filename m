From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 May 2019 11:21:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.0.5
Message-ID: <20190505092109.31394-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://blog.torproject.org/new-release-tor-0405

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 2 +-
 package/tor/tor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 5b07981d95..69a49c9057 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d5c56603942a8927670f50a4a469fb909e29d3571fdd013389d567e57abc0b47  tor-0.3.5.8.tar.gz
+sha256 b5a2cbf0dcd3f1df2675dbd5ec10bbe6f8ae995c41b68cebe2bc95bffc90696e  tor-0.4.0.5.tar.gz
 sha256 b4248f32f009d4f5cccb704b351e31a16590e0dd5fda2856382cc854d81f6234  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index fe951fb266..6ba204130e 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.3.5.8
+TOR_VERSION = 0.4.0.5
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.20.1
