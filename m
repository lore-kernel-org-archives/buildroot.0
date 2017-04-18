From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 22:15:30 +0200
Subject: [Buildroot] [RFC 1/2] configs: raspberrypi3: fix mismatch cpu
 arch
In-Reply-To: <20170416151409.7665-2-gael.portay@savoirfairelinux.com>
References: <20170416151409.7665-1-gael.portay@savoirfairelinux.com>
 <20170416151409.7665-2-gael.portay@savoirfairelinux.com>
Message-ID: <421eb275-49a1-eecc-1790-bee49228a243@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-04-17 17:14, Ga?l PORTAY wrote:
> The raspberrypi3 is powered by a Broadcom BCM2837 which is a Cortex-A53.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Just to be sure: have you boot-tested the new defconfig?

 Regards,
 Arnout

> ---
>  configs/raspberrypi3_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
> index 1b2134e0b..3d8949765 100644
> --- a/configs/raspberrypi3_defconfig
> +++ b/configs/raspberrypi3_defconfig
> @@ -1,5 +1,5 @@
>  BR2_arm=y
> -BR2_cortex_a7=y
> +BR2_cortex_a53=y
>  BR2_ARM_EABIHF=y
>  BR2_ARM_FPU_NEON_VFPV4=y
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
