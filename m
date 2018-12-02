From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] iucode-tool: bump to version 2.3.1
Message-ID: <20181202071554.9CDBA80FDE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6b61d1094c4f1dc533e2b6aeadf240647629278
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Brings several fixes and enhancements. Check the change log at

    https://gitlab.com/iucode-tool/iucode-tool/raw/v2.3.1/ChangeLog

Tested on an equipment with Intel C3000 processor.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iucode-tool/iucode-tool.hash | 2 +-
 package/iucode-tool/iucode-tool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iucode-tool/iucode-tool.hash b/package/iucode-tool/iucode-tool.hash
index 1dab8de978..6d8fb635d0 100644
--- a/package/iucode-tool/iucode-tool.hash
+++ b/package/iucode-tool/iucode-tool.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 9810daf925b8a9ca244adc4e1916bcab65601c9ebe87e91c2281f78055982971  iucode-tool_2.2.tar.xz
+sha256 12b88efa4d0d95af08db05a50b3dcb217c0eb2bfc67b483779e33d498ddb2f95  iucode-tool_2.3.1.tar.xz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 38f9da438e..e900888d7d 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IUCODE_TOOL_VERSION = 2.2
+IUCODE_TOOL_VERSION = 2.3.1
 IUCODE_TOOL_SOURCE = iucode-tool_$(IUCODE_TOOL_VERSION).tar.xz
 IUCODE_TOOL_SITE = https://gitlab.com/iucode-tool/releases/raw/master
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
