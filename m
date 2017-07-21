From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 09:00:48 +0200
Subject: [Buildroot] [git commit] minimal.config: add
	BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
Message-ID: <20170721065642.B71C37FE13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a8567be15cb2868abc9607270d77b21b091302a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The user shouldn't need to pass this manually when creating a test-pkg
config file. It's an absolutely harmless option to enable always.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/config-fragments/minimal.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/config-fragments/minimal.config b/support/config-fragments/minimal.config
index 43fef06..71344e2 100644
--- a/support/config-fragments/minimal.config
+++ b/support/config-fragments/minimal.config
@@ -5,3 +5,4 @@ BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_COMPILER_PARANOID_UNSAFE_PATH=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
