From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 20:04:24 +0100
Subject: [Buildroot] [git commit] package/iucode-tool: bump version
Message-ID: <20141221190432.015F6805F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac5052da0d02d2ea06c6c57b306d2dc2ee4988f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- updated upstream location
  http://metadata.ftp-master.debian.org/changelogs/contrib/i/iucode-tool/unstable_changelog
  "iucode-tool (1.0.2-1) unstable; urgency=low
   [...]
   * debian/control: update for new upstream location at Gitorious"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
