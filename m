From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 21:54:24 +0100
Subject: [Buildroot] [PATCH v2] imx6slevk: fix uImage load address
In-Reply-To: <1422709991-28181-1-git-send-email-gilles.talis@gmail.com>
References: <1422709991-28181-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <20150201215424.0f7183fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gilles Talis,

On Sat, 31 Jan 2015 14:13:11 +0100, Gilles Talis wrote:
> i.MX6 SoloLite SoC has a different external memory base address
> than the other i.MX6 family SoCs:
> - 0x80000000 for i.MX6 SoloLite (see i.MX6 SoloLite Reference Manual [1])
> - 0x10000000 for the others (see i.MX6Quad/Dual Reference Manual [2])
> 
> [1] http://cache.freescale.com/files/32bit/doc/ref_manual/IMX6SLRM.pdf?fasp=1
>     Table 2-1 System Memory Map, MMDC - DDR Controller
> [2] http://cache.freescale.com/files/32bit/doc/ref_manual/IMX6DQRM.pdf?fasp=1
>     Table 2-1 System Memory Map, MMDC - DDR Controller
> 
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
