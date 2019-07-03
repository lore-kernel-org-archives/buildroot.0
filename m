From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Jul 2019 00:41:15 +0200
Subject: [Buildroot] [PATCH 07/22] package/rpi-firmware: add license hash
In-Reply-To: <20190701222634.104301-7-aduskett@gmail.com>
References: <20190701222634.104301-1-aduskett@gmail.com>
 <20190701222634.104301-7-aduskett@gmail.com>
Message-ID: <d33139e0-816f-21bf-ef60-066858dc1041@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/07/2019 00:26, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/rpi-firmware/rpi-firmware.hash | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
> index d719fa6e08..e4992d029c 100644
> --- a/package/rpi-firmware/rpi-firmware.hash
> +++ b/package/rpi-firmware/rpi-firmware.hash
> @@ -1,2 +1,3 @@
>  # Locally computed
>  sha256 e911f6342ea8aa9380cae97c6f5ac4ddd370527265f23d5b5d4b2c6f679d4ba8 rpi-firmware-ebf7b40cdc6effe7ffa3fd5195e8be01b94f80da.tar.gz
> +sha256 ba76edfc10a248166d965b8eaf320771c44f4f432d4fce2fd31fd272e7038add LICENCE.broadcom

 That should be boot/LICENSE.broadcom.

 How did you test this?

 Regards,
 Arnout
