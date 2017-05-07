From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 13:59:51 +0200
Subject: [Buildroot] [git commit] configs/snps_archs38_zebu: rename zebu to
	haps
Message-ID: <20170507120006.D6E3B7FCD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef1ad1fe66a6f55a7d5e1c45c88f665c9470c363
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As in upstream Linux zebu_hs_smp_defconfig was renamed to
haps_hs_smp_defconfig we update Linux kernel defconfig name
respectively.

Also it fixes build failure, pointed us by Arnout:
https://gitlab.com/buildroot.org/buildroot/builds/14419271

Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/{snps_archs38_zebu_defconfig => snps_archs38_haps_defconfig} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/snps_archs38_zebu_defconfig b/configs/snps_archs38_haps_defconfig
similarity index 91%
rename from configs/snps_archs38_zebu_defconfig
rename to configs/snps_archs38_haps_defconfig
index 98beb2b..4f03560 100644
--- a/configs/snps_archs38_zebu_defconfig
+++ b/configs/snps_archs38_haps_defconfig
@@ -14,5 +14,5 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.9"
-BR2_LINUX_KERNEL_DEFCONFIG="zebu_hs_smp"
+BR2_LINUX_KERNEL_DEFCONFIG="haps_hs_smp"
 BR2_LINUX_KERNEL_VMLINUX=y
