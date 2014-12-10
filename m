From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 21:25:54 +0100
Subject: [Buildroot] [PATCH] usbutils: drop double needs from comment
In-Reply-To: <1418172040-18323-1-git-send-email-gustavo@zacarias.com.ar>
References: <1418172040-18323-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141210212554.767720f0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  9 Dec 2014 21:40:40 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/usbutils/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
> index 7920ab8..923853a 100644
> --- a/package/usbutils/Config.in
> +++ b/package/usbutils/Config.in
> @@ -8,5 +8,5 @@ config BR2_PACKAGE_USBUTILS
>  
>  	  http://linux-usb.sourceforge.net/
>  
> -comment "usbutils needs needs udev /dev management and toolchain w/ threads"
> +comment "usbutils needs udev /dev management and toolchain w/ threads"
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_HAS_UDEV

Indeed, my mistake on this one. Thanks for spotting it. Applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
