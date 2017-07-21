From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 09:00:44 +0200
Subject: [Buildroot] [git commit] minimal.config: add
	BR2_COMPILER_PARANOID_UNSAFE_PATH=y
Message-ID: <20170721065642.C45BD82158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6c98b3549d822b791f80c1cf78a18e4e7461054
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We really want test-pkg to do the test with a paranoid unsafe path.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/config-fragments/minimal.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/config-fragments/minimal.config b/support/config-fragments/minimal.config
index 0f20847..43fef06 100644
--- a/support/config-fragments/minimal.config
+++ b/support/config-fragments/minimal.config
@@ -4,3 +4,4 @@ BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 # BR2_TARGET_ROOTFS_TAR is not set
+BR2_COMPILER_PARANOID_UNSAFE_PATH=y
