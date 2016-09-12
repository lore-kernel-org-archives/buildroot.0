From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 23:02:12 +0200
Subject: [Buildroot] [PATCH v2 2/2] mx6ulpico: Use kernel 4.8-rc5
In-Reply-To: <1473696955-24297-2-git-send-email-festevam@gmail.com>
References: <1473696955-24297-1-git-send-email-festevam@gmail.com>
 <1473696955-24297-2-git-send-email-festevam@gmail.com>
Message-ID: <20160912230212.6f8f6fc2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 13:15:55 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@nxp.com>
> 
> With kernel 4.8-rc5 we no longer need to use the "CONFIG_SMP=n" workaround
> as the reboot issue has been fixed upstream by commit 059e232089e4
> ("irqchip/gic: Allow self-SGIs for SMP on UP configurations")
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v1:
> - None

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
