From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 23:09:07 +0200
Subject: [Buildroot] [git commit] arc: disable Crosstool-NG for ARC
Message-ID: <20130504212451.4425499ABB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb232b31ffc75b37465995ae9223fad09bda2489
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index fa78cf4..e6a3b25 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -22,7 +22,7 @@ config BR2_TOOLCHAIN_EXTERNAL
 
 config BR2_TOOLCHAIN_CTNG
 	bool "Crosstool-NG toolchain"
-	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa
+	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_xtensa && !BR2_arc
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	help
 	  Say 'y' if you want to generate the toolchain with crosstool-NG
