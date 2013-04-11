From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Apr 2013 07:51:59 +0200
Subject: [Buildroot] [git commit] toolchain-external: get old microblaze
	toolchains from sources.buildroot.net
Message-ID: <20130411055208.120439B53B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25b3af0a978169760aecf0ef95246b02f8c06ffb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

git.xilinx.com is no longer available (moved to github), and github
doesn't allow downloading the tarball blobs directly, so use a local
mirror on sources.buildroot.net instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/ext-tool.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index d667b86..c4ddb0b 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -262,13 +262,13 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE=lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2),y)
-TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;h=d7b493c5dbcc24ba9cc3be2e4c14d6d9701e6805;hb=00163583b771bb4e937632765dd0c5516b3e31c4;f=
+TOOLCHAIN_EXTERNAL_SITE=http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE=microblazeel-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE=lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
-TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;h=71e031ae990e063a5718f90d30cf97ad85e2f565;hb=569081301f0f1d8d3b24335a364e8ff1774190d4;f=
+TOOLCHAIN_EXTERNAL_SITE=http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01),y)
 TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/13.01/components/toolchain/binaries/
