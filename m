From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 14 Aug 2019 19:55:44 +0200
Subject: [Buildroot] [PATCH 2/4] package/dahdi-tools: bump to version 3.0.0
In-Reply-To: <20190814175546.14670-1-fontaine.fabrice@gmail.com>
References: <20190814175546.14670-1-fontaine.fabrice@gmail.com>
Message-ID: <20190814175546.14670-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dahdi-tools/dahdi-tools.hash | 4 ++--
 package/dahdi-tools/dahdi-tools.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dahdi-tools/dahdi-tools.hash b/package/dahdi-tools/dahdi-tools.hash
index 7b668c6049..5538ed6b8a 100644
--- a/package/dahdi-tools/dahdi-tools.hash
+++ b/package/dahdi-tools/dahdi-tools.hash
@@ -1,7 +1,7 @@
 # sha1 from http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
 # sha256 locally computed
-sha1    5da944e6d59a977f814230253f3ddf2847e7f31b                          dahdi-tools-2.11.1.tar.gz
-sha256  53ffeb333f3e44b0c88e5b17475cdbf87d3f652eb81a6422de76250c061e2909  dahdi-tools-2.11.1.tar.gz
+sha1    3e988256aae4b6a6ed8efb3ecc07753779f54823                          dahdi-tools-3.0.0.tar.gz
+sha256  5bebb20d5ae13fa13f0e2075603013954b962be477db02271eef44b3e41557c5  dahdi-tools-3.0.0.tar.gz
 
 # License files, locally computed
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  LICENSE
diff --git a/package/dahdi-tools/dahdi-tools.mk b/package/dahdi-tools/dahdi-tools.mk
index e97d944c52..392dc09140 100644
--- a/package/dahdi-tools/dahdi-tools.mk
+++ b/package/dahdi-tools/dahdi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAHDI_TOOLS_VERSION = 2.11.1
+DAHDI_TOOLS_VERSION = 3.0.0
 DAHDI_TOOLS_SITE = http://downloads.asterisk.org/pub/telephony/dahdi-tools/releases
 
 DAHDI_TOOLS_LICENSE = GPLv2, LGPLv2.1
-- 
2.20.1
