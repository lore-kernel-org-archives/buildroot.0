From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 02:32:17 +0200
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: fix syntax
In-Reply-To: <20170722214728.31536-1-yann.morin.1998@free.fr>
References: <20170722214728.31536-1-yann.morin.1998@free.fr>
Message-ID: <1f4febd9-d9ec-59df-b2d2-c3631ca338c3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-07-17 23:47, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/kvm-unit-tests/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/kvm-unit-tests/Config.in b/package/kvm-unit-tests/Config.in
> index 8b172c3f21..d0d9e2ef96 100644
> --- a/package/kvm-unit-tests/Config.in
> +++ b/package/kvm-unit-tests/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_KVM_UNIT_TESTS_ARCH_SUPPORTS
>  	bool
>  	# On ARM, it uses virtualization extensions
>  	default y if BR2_cortex_a7 || BR2_cortex_a12 || \
> -		BR2_cortex_a15 || BR2_cortex_a15_a7 \
> +		BR2_cortex_a15 || BR2_cortex_a15_a7 || \
>  		BR2_cortex_a17 || BR2_cortex_a17_a7
>  	default y if BR2_i386 || BR2_x86_64
>  	default y if BR2_powerpc64 || BR2_powerpc64le
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
