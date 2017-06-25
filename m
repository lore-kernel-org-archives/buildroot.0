From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jun 2017 15:54:18 +0200
Subject: [Buildroot] [PATCH] uboot-tools: drop unreferenced empty
 variable
In-Reply-To: <b0f05bfb286331e3658cd6088159a5e8cf9b8a9d.1498395855.git.baruch@tkos.co.il>
References: <b0f05bfb286331e3658cd6088159a5e8cf9b8a9d.1498395855.git.baruch@tkos.co.il>
Message-ID: <20170625155418.29402b70@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Jun 2017 16:04:15 +0300, Baruch Siach wrote:
> Commit log 0e0ea8cf5e2c57 (uboot-tools: install libubootenv to staging)
> mentions that installation is done in <pkg>_INSTALL_STAGING_CMDS directly, but
> forgot to remove the now empty UBOOT_TOOLS_INSTALL_LIBUBOOTENV.
> 
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/uboot-tools/uboot-tools.mk | 3 ---
>  1 file changed, 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
