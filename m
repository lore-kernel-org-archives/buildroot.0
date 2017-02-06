From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 09:00:11 -0500
Subject: [Buildroot] [PATCH 4/5] pps-tools: bump to version
	97eaef2ab82a46d13ea5e00270712d6475fbe42b
In-Reply-To: <20170206140012.1029-1-aduskett@codeblue.com>
References: <20170206140012.1029-1-aduskett@codeblue.com>
Message-ID: <20170206140012.1029-4-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/pps-tools/pps-tools.hash | 2 +-
 package/pps-tools/pps-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pps-tools/pps-tools.hash b/package/pps-tools/pps-tools.hash
index 9fa62cb..da7bce4 100644
--- a/package/pps-tools/pps-tools.hash
+++ b/package/pps-tools/pps-tools.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 28d4e5aa845f659a6ab4174bbf579e22e2d2c87dc72fd6d07306a6a249c27c76  pps-tools-0deb9c7e135e9380a6d09e9d2e938a146bb698c8.tar.gz
+sha256 eee0a76118cf11d94f575ee43804a6991379f2c734b400ba01ac4811d0498e97  pps-tools-47333f24af878f67ce48022e8af16419713aa1ac.tar.gz
diff --git a/package/pps-tools/pps-tools.mk b/package/pps-tools/pps-tools.mk
index 48feea9..c3e147a 100644
--- a/package/pps-tools/pps-tools.mk
+++ b/package/pps-tools/pps-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PPS_TOOLS_VERSION = 0deb9c7e135e9380a6d09e9d2e938a146bb698c8
+PPS_TOOLS_VERSION = 47333f24af878f67ce48022e8af16419713aa1ac
 PPS_TOOLS_SITE = $(call github,ago,pps-tools,$(PPS_TOOLS_VERSION))
 PPS_TOOLS_INSTALL_STAGING = YES
 PPS_TOOLS_LICENSE = GPLv2+
-- 
2.9.3
