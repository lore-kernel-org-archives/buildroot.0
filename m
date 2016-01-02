From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 2 Jan 2016 02:30:22 +0100
Subject: [Buildroot] [PATCH 46/84 RFC] package/directfb: use 'menuconfig'
In-Reply-To: <1b63f13fc3066aa397dedf17e729b031497ce113.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <1b63f13fc3066aa397dedf17e729b031497ce113.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <5687282E.1070904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:25, Yann E. MORIN wrote:
> directfb has more than 5 options, so use a 'menuconfig' to group the
> options in an sub-menu.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/directfb/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index 73425d3..6a233dc 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_DIRECTFB
> +menuconfig BR2_PACKAGE_DIRECTFB
>  	bool "directfb"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_INSTALL_LIBSTDCPP
> 

 Maybe directfb-examples should be moved into this menu as well?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
