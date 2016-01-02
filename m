From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 22:56:25 +0100
Subject: [Buildroot] [PATCH 80/84 RFC] boot/at91bootstrap3: use
 'menuconfig'
In-Reply-To: <6e4ec02d3d97c4d6e87aaf93f2abbcdabd3d91e8.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <6e4ec02d3d97c4d6e87aaf93f2abbcdabd3d91e8.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <56884789.6070807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:25, Yann E. MORIN wrote:
> at91bootstrap3 has more than 5 options, so use a 'menuconfig' to
> group the options in an sub-menu.

 It's a bit weird that at91bootstrap3 has a menu and at91bootstrap doesn't, but OK.

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  boot/at91bootstrap3/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
> index b8ebe80..6f4050c 100644
> --- a/boot/at91bootstrap3/Config.in
> +++ b/boot/at91bootstrap3/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_TARGET_AT91BOOTSTRAP3
> +menuconfig BR2_TARGET_AT91BOOTSTRAP3
>  	depends on BR2_arm926t || BR2_cortex_a5
>  	bool "AT91 Bootstrap 3"
>  	help
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
