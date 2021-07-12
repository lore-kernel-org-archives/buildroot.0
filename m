From: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Mon, 12 Jul 2021 18:33:46 +0200
Subject: [Buildroot] [PATCH 1/3] imx/post-image.sh: Support
 BR2_LINUX_KERNEL_INSTALL_TARGET=y for non-SPL
In-Reply-To: <20210711201954.2142662-1-festevam@gmail.com>
References: <20210711201954.2142662-1-festevam@gmail.com>
Message-ID: <be5d009e-b383-038f-02fe-9a19d79bc01c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

Le 11/07/2021 ? 22:19, Fabio Estevam a ?crit?:
> Currently, only SPL is supported when BR2_LINUX_KERNEL_INSTALL_TARGET=y
> is selected.
> 
> Support non-SPL case too.
> 
> This is needed for booting imx7d-sabresd, for example.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Pierre-Jean Texier <texier.pj2@gmail.com>

Thanks
-- 
Pierre-Jean Texier
