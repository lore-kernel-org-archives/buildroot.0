From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:21 +0200
Subject: [Buildroot] [PATCH v7 14/23] minimal.config: add
	BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-15-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The user shouldn't need to pass this manually when creating a test-pkg
config file. It's an absolutely harmless option to enable always.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v7: new patch
---
 support/config-fragments/minimal.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/config-fragments/minimal.config b/support/config-fragments/minimal.config
index 43fef06f49..71344e2c69 100644
--- a/support/config-fragments/minimal.config
+++ b/support/config-fragments/minimal.config
@@ -5,3 +5,4 @@ BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_COMPILER_PARANOID_UNSAFE_PATH=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
-- 
2.13.2
