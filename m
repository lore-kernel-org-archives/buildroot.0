From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:20 +0200
Subject: [Buildroot] [PATCH v7 13/23] minimal.config: add
	BR2_COMPILER_PARANOID_UNSAFE_PATH=y
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-14-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We really want test-pkg to do the test with a paranoid unsafe path.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v7: new patch
---
 support/config-fragments/minimal.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/config-fragments/minimal.config b/support/config-fragments/minimal.config
index 0f20847f6d..43fef06f49 100644
--- a/support/config-fragments/minimal.config
+++ b/support/config-fragments/minimal.config
@@ -4,3 +4,4 @@ BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_COMPILER_PARANOID_UNSAFE_PATH=y
-- 
2.13.2
