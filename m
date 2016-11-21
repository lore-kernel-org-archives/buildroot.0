From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 22:43:42 +0100
Subject: [Buildroot] [PATCH] configs/imx28evk: Bump to kernel 4.8.8
In-Reply-To: <1479664980-29851-1-git-send-email-festevam@gmail.com>
References: <1479664980-29851-1-git-send-email-festevam@gmail.com>
Message-ID: <20161121224342.1428e9c0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 20 Nov 2016 16:03:00 -0200, Fabio Estevam wrote:
> Kernel 4.8.8 brings commit 235bde1ed3f0ff ("net: fec: Call swap_buffer()
> prior to IP header alignment"), which makes Ethernet functional again
> on mx28.
> 
> Bump to this version.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> This patch depends on Vicente's series that bumps linux-headers and kernel
> version to 4.8.8

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
