From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:30:46 +0100
Subject: [Buildroot] [PATCH] configs/nexbox_a95x: kernel needs
 host-openssl
In-Reply-To: <20181209094146.26427-1-yann.morin.1998@free.fr>
References: <20181209094146.26427-1-yann.morin.1998@free.fr>
Message-ID: <20181209173046.19398bba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Dec 2018 10:41:46 +0100, Yann E. MORIN wrote:
> Fixes: https://gitlab.com/ymorin/buildroot/-/jobs/131924236
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  configs/nexbox_a95x_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied to master with a slightly extended commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
