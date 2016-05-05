From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:20:45 +0200
Subject: [Buildroot] [PATCH 1/3] configs/freescale_mpc8315erdb: lock
 down binutils version
In-Reply-To: <1462462230-30078-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462462230-30078-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160505222045.0a8356f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  5 May 2016 12:30:28 -0300, Gustavo Zacarias wrote:
> The used U-Boot version (2014.04) isn't too happy with newer (>= 2.25)
> binutils versions, so keep it locked down until the config is updated
> for a newer version.
> U-Boot 2016.03 in fact does work for mpc8315erdb - however it doesn't
> yet support SPL which is necessary for NAND boot and would be a massive
> defconfig revamp switching to NOR.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  configs/freescale_mpc8315erdb_defconfig | 2 ++
>  1 file changed, 2 insertions(+)

All three applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
