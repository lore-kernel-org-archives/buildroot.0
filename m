From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Oct 2013 21:53:03 +0200
Subject: [Buildroot] [PATCH] Added initial support for Freescale i.mx6
 sabreauto board
In-Reply-To: <BLU0-SMTP3860F7C844E630CB0FCC659F70C0@phx.gbl>
References: <BLU0-SMTP3860F7C844E630CB0FCC659F70C0@phx.gbl>
Message-ID: <52697A9F.3000707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/10/13 19:28, Abdul Hussain wrote:
> Signed-off-by: Abdul Hussain<hussain.abdul@outlook.com>
> ---
>   configs/imx6qsabreauto_defconfig | 1132 ++++++++++++++++++++++++++++++++++++++

  Please use a defconfig, not a full config. The easiest way to generate 
it is to set BR2_DEFCONFIG to configs/imx6qsabreauto_defconfig, and then 
run 'make savedefconfig'.

>   system/device_table_dev.txt      |    2 +-

  You should mention in the commit message that you did this change and why.

  Regards,
  Arnout

>   2 files changed, 1133 insertions(+), 1 deletion(-)
>   create mode 100644 configs/imx6qsabreauto_defconfig


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
