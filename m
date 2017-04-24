From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Mon, 24 Apr 2017 13:30:01 +0000
Subject: [Buildroot] [PATCH] configs/snps_archs38_zebu: rename zebu to
	haps
In-Reply-To: <1492532385-24563-1-git-send-email-vzakhar@synopsys.com>
References: <1492532385-24563-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <1493040601.2643.10.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Peter,

On Tue, 2017-04-18 at 19:19 +0300, Vlad Zakharov wrote:
> As in upstream Linux zebu_hs_smp_defconfig was renamed to
> haps_hs_smp_defconfig we update Linux kernel defconfig name
> respectively.
> 
> Also it fixes build failure, pointed us by Arnout:
> https://gitlab.com/buildroot.org/buildroot/builds/14419271
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
> ?configs/{snps_archs38_zebu_defconfig => snps_archs38_haps_defconfig} | 2 +-
> ?1 file changed, 1 insertion(+), 1 deletion(-)
> ?rename configs/{snps_archs38_zebu_defconfig => snps_archs38_haps_defconfig} (91%)
> 
> diff --git a/configs/snps_archs38_zebu_defconfig b/configs/snps_archs38_haps_defconfig
> similarity index 91%
> rename from configs/snps_archs38_zebu_defconfig
> rename to configs/snps_archs38_haps_defconfig
> index 98beb2b..4f03560 100644
> --- a/configs/snps_archs38_zebu_defconfig
> +++ b/configs/snps_archs38_haps_defconfig
> @@ -14,5 +14,5 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
> ?BR2_LINUX_KERNEL=y
> ?BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> ?BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.9"
> -BR2_LINUX_KERNEL_DEFCONFIG="zebu_hs_smp"
> +BR2_LINUX_KERNEL_DEFCONFIG="haps_hs_smp"
> ?BR2_LINUX_KERNEL_VMLINUX=y

Please treat this message how a polite remainder to review this patch.

Thanks.

-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>
