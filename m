From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 18:50:31 +0200
Subject: [Buildroot] [PATCH] usb_modeswitch: adjust help
In-Reply-To: <1413909575-31048-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413909575-31048-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141021165031.GG3912@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-21 13:39 -0300, Gustavo Zacarias spake thusly:
> The phrasing is a bit off, also there are no WiFi dongles that need this
> AFAIK.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/usb_modeswitch/Config.in | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/usb_modeswitch/Config.in b/package/usb_modeswitch/Config.in
> index e4c7168..f709a55 100644
> --- a/package/usb_modeswitch/Config.in
> +++ b/package/usb_modeswitch/Config.in
> @@ -3,16 +3,16 @@ config BR2_PACKAGE_USB_MODESWITCH
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
>  	select BR2_PACKAGE_LIBUSB
>  	help
> -	  Some models of some USB devices such as modems and Wifi
> -	  adapters power-up in mass storage mode to provide access to
> -	  drivers for the device's application mode. usb_modeswitch
> +	  Some USB devices such as 3G/4G broadband modems power-up
> +	  in mass storage mode to provide access to drivers
> +	  for the device's application mode. usb_modeswitch
>  	  changes the mode of such devices from the initial power-up
> -	  mode to the application mode. Specific configuration data
> -	  for each device model is required.
> +	  mode to the application mode.
> +	  Specific configuration data for each device model is required.
>  
>  	  usb_modeswitch can be used with the usb_modeswitch_data
> -	  package and udev for automatic mode switching when devices
> -	  are connected.
> +	  package and eudev/systemd for automatic mode switching
> +	  when devices are connected.
>  
>  	  For more information search the Internet for "Virtual CD-ROM
>  	  switching utility".
> -- 
> 2.0.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
