From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Dec 2014 11:09:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/iucode-tool: bump version
In-Reply-To: <1419156571-12002-1-git-send-email-bernd.kuhls@t-online.de>
References: <1419156571-12002-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1419156571-12002-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- updated upstream location
  http://metadata.ftp-master.debian.org/changelogs/contrib/i/iucode-tool/unstable_changelog
  "iucode-tool (1.0.2-1) unstable; urgency=low
   [...]
   * debian/control: update for new upstream location at Gitorious"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/iucode-tool/Config.in      |    2 +-
 package/iucode-tool/iucode-tool.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iucode-tool/Config.in b/package/iucode-tool/Config.in
index 8f90350..b996b36 100644
--- a/package/iucode-tool/Config.in
+++ b/package/iucode-tool/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_IUCODE_TOOL
 	help
 	  Intel processor microcode tool
 
-	  http://packages.debian.org/source/iucode-tool
+	  https://gitorious.org/iucode-tool
diff --git a/package/iucode-tool/iucode-tool.mk b/package/iucode-tool/iucode-tool.mk
index 081b086..44d49d9 100644
--- a/package/iucode-tool/iucode-tool.mk
+++ b/package/iucode-tool/iucode-tool.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IUCODE_TOOL_VERSION = v1.0.1
-IUCODE_TOOL_SITE = git://git.debian.org/users/hmh/iucode-tool.git
+IUCODE_TOOL_VERSION = 1cbd73013cd4c6b2b287f07f6189eef35cb83ca0
+IUCODE_TOOL_SITE = git://gitorious.org/iucode-tool/iucode-tool.git
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 IUCODE_TOOL_CONF_ENV = LIBS="-largp"
 IUCODE_TOOL_DEPENDENCIES = argp-standalone
-- 
1.7.10.4
