From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 19:22:55 +0200
Subject: [Buildroot] [PATCH] configs/snps_archs38_zebu: rename zebu to
	haps
In-Reply-To: <1492532385-24563-1-git-send-email-vzakhar@synopsys.com>
References: <1492532385-24563-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <a5bc683f-0cae-b419-4998-019b1f4ae8a5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-04-17 18:19, Vlad Zakharov wrote:
> As in upstream Linux zebu_hs_smp_defconfig was renamed to
> haps_hs_smp_defconfig we update Linux kernel defconfig name
> respectively.
> 
> Also it fixes build failure, pointed us by Arnout:
> https://gitlab.com/buildroot.org/buildroot/builds/14419271
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  configs/{snps_archs38_zebu_defconfig => snps_archs38_haps_defconfig} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename configs/{snps_archs38_zebu_defconfig => snps_archs38_haps_defconfig} (91%)
> 
> diff --git a/configs/snps_archs38_zebu_defconfig b/configs/snps_archs38_haps_defconfig
> similarity index 91%
> rename from configs/snps_archs38_zebu_defconfig
> rename to configs/snps_archs38_haps_defconfig
> index 98beb2b..4f03560 100644
> --- a/configs/snps_archs38_zebu_defconfig
> +++ b/configs/snps_archs38_haps_defconfig
> @@ -14,5 +14,5 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION=y
>  BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10.9"
> -BR2_LINUX_KERNEL_DEFCONFIG="zebu_hs_smp"
> +BR2_LINUX_KERNEL_DEFCONFIG="haps_hs_smp"
>  BR2_LINUX_KERNEL_VMLINUX=y
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
