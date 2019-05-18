From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:33:53 +0200
Subject: [Buildroot] [PATCH 1/1]
 board/lemaker/bananapro/linux-wifi.fragment: add rfkill driver into kernel
 by default
In-Reply-To: <20190508180210.10521-1-b.bilas@grinn-global.com>
References: <20190508180210.10521-1-b.bilas@grinn-global.com>
Message-ID: <20190518233353.4076d3fd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  8 May 2019 20:02:10 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> This fixes following error:
> 
> 	# wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
> 	Successfully initialized wpa_supplicant
> 	rfkill: Cannot open RFKILL control device
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  board/lemaker/bananapro/linux-wifi.fragment | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
