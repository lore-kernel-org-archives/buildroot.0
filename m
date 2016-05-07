From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 May 2016 09:13:48 +0200
Subject: [Buildroot] [PATCH v3 2/3] uboot-tools: add patch to fix
 linking with libubootenv
In-Reply-To: <1462187815-2414-2-git-send-email-joerg.krause@embedded.rocks>
References: <1462187815-2414-1-git-send-email-joerg.krause@embedded.rocks>
 <1462187815-2414-2-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20160507091348.6fe357f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  2 May 2016 13:16:54 +0200, J?rg Krause wrote:
> Backport a patch from upstream [1] to fix linking with libubootenv:
> 	fw_env.c:(.text+0x94): undefined reference to `common_args'
> 
> [1] http://git.denx.de/?p=u-boot.git;a=commit;h=43cb65b7a00e4759427a6e4b8a02039e43dab5a5
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...ug-config-structs-must-be-defined-in-tool.patch | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 package/uboot-tools/0003-tools-env-bug-config-structs-must-be-defined-in-tool.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
