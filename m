From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 15:11:42 +0200
Subject: [Buildroot] [git commit] pwgen: add host utilities menu entry
Message-ID: <20140701131221.0BEB59D125@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66770f1a93a976d74316b4269a885ccf904f3148
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host       |    1 +
 package/pwgen/Config.in.host |    7 +++++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index cf09e46..062c6c9 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -13,6 +13,7 @@ menu "Host utilities"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/parted/Config.in.host"
+	source "package/pwgen/Config.in.host"
 	source "package/sam-ba/Config.in.host"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
diff --git a/package/pwgen/Config.in.host b/package/pwgen/Config.in.host
new file mode 100644
index 0000000..0c56851
--- /dev/null
+++ b/package/pwgen/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_PWGEN
+	bool "host pwgen"
+	help
+	  Pwgen is a small, GPL'ed password generator which creates passwords
+	  which can be easily memorized by a human.
+
+	  http://sourceforge.net/projects/pwgen/
