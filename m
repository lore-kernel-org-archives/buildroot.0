From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Aug 2009 14:39:30 +0200
Subject: [Buildroot] [git commit master] u-boot: mark old 2008.10 version as
	deprecated
Message-ID: <20090827124024.6B23277691@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1af58aff7222e88a844a2c8f0f9121b99321dd83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/u-boot/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target/u-boot/Config.in b/target/u-boot/Config.in
index a4994c4..a62e851 100644
--- a/target/u-boot/Config.in
+++ b/target/u-boot/Config.in
@@ -30,6 +30,7 @@ config BR2_TARGET_UBOOT_2009_01
 
 config BR2_TARGET_UBOOT_2008_10
 	bool "u-boot-2008.10"
+	depends on BR2_DEPRECATED
 
 config BR2_TARGET_UBOOT_1_3_4
 	bool "u-boot-1.3.4"
-- 
1.6.3.3
