From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 21:25:25 +0200
Subject: [Buildroot] [PATCH 1/3] board/atmel: at91sam9x5ek_mmc: add 1M
 offset for FAT partition
In-Reply-To: <20170621081201.7717-1-ludovic.desroches@microchip.com>
References: <20170621081201.7717-1-ludovic.desroches@microchip.com>
Message-ID: <20170621212525.4c26536b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Jun 2017 10:11:59 +0200, Ludovic Desroches wrote:
> at91sam9x5ek_mmc board was missing in the previous patch adding 1M
> offset for FAT partition to solve some boot issues with the ROM code.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
> ---
>  board/atmel/at91sam9x5ek_mmc/genimage.cfg | 1 +
>  1 file changed, 1 insertion(+)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
