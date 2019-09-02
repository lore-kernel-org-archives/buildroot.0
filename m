From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:12:38 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/dahdi-tools: bump
 to version 3.0.0
Message-ID: <20190902150830.9C61E8A295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ffc193a60f2f22ac332a96c2657be309f731a61c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dca1dff5018b0f00c1590ac1ec40a3535e71dd2d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
