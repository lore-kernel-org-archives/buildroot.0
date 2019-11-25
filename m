From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Mon, 25 Nov 2019 19:13:07 +0100
Subject: [Buildroot] [PATCH/next] gitlab-ci: regenerate after new defconfig
 addition
Message-ID: <1574705587-7486-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes b68022c7cb17d27acc14ff64434413e8c93d7a56 ("board: add Beelink GS1 support")

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9ef9313..22befa0 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -161,6 +161,7 @@ beagleboardx15_defconfig: { extends: .defconfig }
 beaglebone_defconfig: { extends: .defconfig }
 beaglebone_qt5_defconfig: { extends: .defconfig }
 beagleboneai_defconfig: { extends: .defconfig }
+beelink_gs1_defconfig: { extends: .defconfig }
 chromebook_snow_defconfig: { extends: .defconfig }
 ci20_defconfig: { extends: .defconfig }
 csky_gx6605s_defconfig: { extends: .defconfig }
-- 
2.7.4
