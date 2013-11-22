From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Nov 2013 23:55:03 +0100
Subject: [Buildroot] [PATCH 3/5] package/rpi-firmware: move to
	bootloaders menu
In-Reply-To: <869fff522738fdd927541a3e3a303f97143f8469.1385157864.git.yann.morin.1998@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <869fff522738fdd927541a3e3a303f97143f8469.1385157864.git.yann.morin.1998@free.fr>
Message-ID: <20131122225503.GC3371@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-11-22 23:50 +0100, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
[--SNIP--]
> Hence, move rpi-firmware from the target packages submenu, into the
> bootloaders submenu.
[--SNIP--]
> diff --git a/package/rpi-firmware/Config.in b/boot/rpi-firmware/Config.in
> similarity index 71%
> rename from package/rpi-firmware/Config.in
> rename to boot/rpi-firmware/Config.in
> index ce5b974..fea292b 100644
> --- a/package/rpi-firmware/Config.in
> +++ b/boot/rpi-firmware/Config.in
> @@ -1,4 +1,4 @@
> -config BR2_PACKAGE_RPI_FIRMWARE
> +config BR2_TARGET_RPI_FIRMWARE

Doh, I forgot to add this to LEGACY... :-(
I will do before the next round.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
