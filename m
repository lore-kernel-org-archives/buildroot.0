From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 20:45:10 +0100
Subject: [Buildroot] [git commit] gitlab-ci.yml: regenerate after new
 defconfig addition
Message-ID: <20191202083935.4FA7D7FA91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44649f6ce410e20998d959d66cb61b365531a3ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes b68022c7cb17d27acc14ff64434413e8c93d7a56 ("board: add Beelink GS1 support")

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9ef93130a1..22befa0427 100644
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
