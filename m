From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:02:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: embed all
 RS9113 firmware files to target image
In-Reply-To: <AM7P191MB054930430C2D0B091B846E1EED640@AM7P191MB0549.EURP191.PROD.OUTLOOK.COM>
References: <AM7P191MB054930430C2D0B091B846E1EED640@AM7P191MB0549.EURP191.PROD.OUTLOOK.COM>
Message-ID: <20191026150223.41eef254@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 11:58:21 +0000
Adrien Ricciardi <adrien.ricciardi@hotmail.fr> wrote:

> Only rs9113_wlan_qspi.rps firmware was present on generated image.
> 
> Signed-off-by: Adrien Ricciardi <adrien.ricciardi@hotmail.fr>
> ---
>  package/linux-firmware/linux-firmware.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
