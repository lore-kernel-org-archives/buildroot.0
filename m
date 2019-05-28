From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 May 2019 10:29:37 +0200
Subject: [Buildroot] [PATCH next 4/4] support/config-fragments/autobuild:
 add testing for the C-SKY architecture
In-Reply-To: <20190528082938.5997-1-thomas.petazzoni@bootlin.com>
References: <20190528082938.5997-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190528082938.5997-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/config-fragments/autobuild/csky.config           | 3 +++
 support/config-fragments/autobuild/toolchain-configs.csv | 1 +
 2 files changed, 4 insertions(+)
 create mode 100644 support/config-fragments/autobuild/csky.config

diff --git a/support/config-fragments/autobuild/csky.config b/support/config-fragments/autobuild/csky.config
new file mode 100644
index 0000000000..c3275efc4b
--- /dev/null
+++ b/support/config-fragments/autobuild/csky.config
@@ -0,0 +1,3 @@
+BR2_csky=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_CSKY=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index 15a69d60ee..3da53556d3 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -59,6 +59,7 @@ support/config-fragments/autobuild/br-sparc64-glibc.config,x86_64
 support/config-fragments/autobuild/br-x86-64-core2-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full.config,x86_64
 support/config-fragments/autobuild/br-xtensa-full-internal.config,any
+support/config-fragments/autobuild/csky.config,x86_64
 support/config-fragments/autobuild/linaro-aarch64.config,x86
 support/config-fragments/autobuild/linaro-aarch64-be.config,x86
 support/config-fragments/autobuild/linaro-arm.config,x86
-- 
2.21.0
