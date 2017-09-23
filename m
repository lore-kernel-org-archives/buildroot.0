From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 20:51:46 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: update after adding
	bananapi_m2_plus_defconfig
Message-ID: <20170923184645.A363B80FE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c0455add508dc4f45f2c82401b4a0f3bb48d88a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit cef57c964284f9b545a2347dd6eb1654e03dfd6e added
bananapi_m2_plus_defconfig but forgot to update .gitlab-ci.yml. Do it
now.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e140f60..1d1e7bd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -87,6 +87,7 @@ atmel_sama5d4_xplained_defconfig: *defconfig
 atmel_sama5d4_xplained_dev_defconfig: *defconfig
 atmel_sama5d4_xplained_mmc_defconfig: *defconfig
 atmel_sama5d4_xplained_mmc_dev_defconfig: *defconfig
+bananapi_m2_plus_defconfig: *defconfig
 bananapro_defconfig: *defconfig
 beagleboardx15_defconfig: *defconfig
 beaglebone_defconfig: *defconfig
