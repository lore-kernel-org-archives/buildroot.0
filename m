From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Apr 2019 09:27:21 +0200
Subject: [Buildroot] [git commit] support/config-fragments/autobuild: test
 the Andes nds32 architecture
Message-ID: <20190417074345.1365D7F9A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31161bfe9c4cdc2b799a7a7874fc9a062258f2c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
Signed-off-by: Greentime Hu <greentime@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/andes-nds32.config    | 3 +++
 support/config-fragments/autobuild/toolchain-configs.csv | 1 +
 2 files changed, 4 insertions(+)

diff --git a/support/config-fragments/autobuild/andes-nds32.config b/support/config-fragments/autobuild/andes-nds32.config
new file mode 100644
index 0000000000..541677e002
--- /dev/null
+++ b/support/config-fragments/autobuild/andes-nds32.config
@@ -0,0 +1,3 @@
+BR2_nds32=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 60ce1a9786..15a69d60ee 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -22,6 +22,7 @@ support/config-fragments/autobuild/br-arm-full-static.config,x86_64
 support/config-fragments/autobuild/sourcery-arm.config,x86
 
 # Toolchains used by test-pkg only when the '-a' option is passed:
+support/config-fragments/autobuild/andes-nds32.config,x86
 support/config-fragments/autobuild/arm-aarch64.config,x86_64
 support/config-fragments/autobuild/br-aarch64-glibc.config,x86_64
 support/config-fragments/autobuild/br-arc-full-internal.config,any
