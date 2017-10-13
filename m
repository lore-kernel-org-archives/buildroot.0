From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 13 Oct 2017 19:09:09 +0300
Subject: [Buildroot] [PATCH] support/config-fragments/autobuild: Add ARC
	glibc fragment
Message-ID: <20171013160909.1408-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc is now supported for ARC so let's kick-start autobuilders
with glibc toolchain for ARC HS.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/config-fragments/autobuild/br-arc-full-internal-glibc.config | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 support/config-fragments/autobuild/br-arc-full-internal-glibc.config

diff --git a/support/config-fragments/autobuild/br-arc-full-internal-glibc.config b/support/config-fragments/autobuild/br-arc-full-internal-glibc.config
new file mode 100644
index 0000000000..b9d6857240
--- /dev/null
+++ b/support/config-fragments/autobuild/br-arc-full-internal-glibc.config
@@ -0,0 +1,4 @@
+BR2_arcle=y
+BR2_archs38=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
-- 
2.11.0
