From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 27 Aug 2020 13:05:22 +0200
Subject: [Buildroot] [PATCH 3/3] package/netopeer2: bump verstion to 1.1.39
Message-ID: <20200827110523.30045-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/netopeer2/netopeer2.hash | 2 +-
 package/netopeer2/netopeer2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 93a094d563..1d5997505f 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  66f3ad68cc6e41f3231b090ef27016ccbfe007cda7d08ec19f409f7429f46ff9  netopeer2-1.1.34.tar.gz
+sha256  e983683eda68792fedd73af54a5c7997496091489aa921f2a9e0dd27f2f6e19a  netopeer2-1.1.39.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 641666e8d3..5787d3a8cf 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 1.1.34
+NETOPEER2_VERSION = 1.1.39
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
-- 
2.20.1
