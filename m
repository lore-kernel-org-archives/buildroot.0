From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 6 Oct 2017 23:41:32 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: update with
	atmel_sama5d27_som1_ek_mmc_dev_defconfig
Message-ID: <20171006213528.9568781056@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e46cbfc3cde669ff613fc287496bb7e5924539e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 95cb1465f09dd7d88cc84d60c735b04e8f4ef244 added the
atmel_sama5d27_som1_ek_mmc_dev_defconfig but forgot to update
.gitlab-ci.yml. Update it now.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index af35a04..e11edbe 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -76,6 +76,7 @@ at91sam9x5ek_defconfig: *defconfig
 at91sam9x5ek_dev_defconfig: *defconfig
 at91sam9x5ek_mmc_defconfig: *defconfig
 at91sam9x5ek_mmc_dev_defconfig: *defconfig
+atmel_sama5d27_som1_ek_mmc_dev_defconfig: *defconfig
 atmel_sama5d2_xplained_mmc_defconfig: *defconfig
 atmel_sama5d2_xplained_mmc_dev_defconfig: *defconfig
 atmel_sama5d3_xplained_defconfig: *defconfig
