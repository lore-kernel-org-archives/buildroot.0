From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 18 Dec 2019 21:49:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/firmware-imx: fix
 license hashes
In-Reply-To: <20191218185633.317123-1-juju@cotds.org>
References: <20191218185633.317123-1-juju@cotds.org>
Message-ID: <20191218204928.GA26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2019-12-18 19:56 +0100, Julien Olivain spake thusly:
> License files were updated since the previous version.
> This patch update to the new license hashes. It also fixes the
> "make legal-info" command failure due to the hash mismatch.
> 
> Signed-off-by: Julien Olivain <juju@cotds.org>

Applied to master, after adding a reference to the autobuilder failure.
Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/freescale-imx/firmware-imx/firmware-imx.hash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/freescale-imx/firmware-imx/firmware-imx.hash b/package/freescale-imx/firmware-imx/firmware-imx.hash
> index 6d99ec0077..85f203311f 100644
> --- a/package/freescale-imx/firmware-imx/firmware-imx.hash
> +++ b/package/freescale-imx/firmware-imx/firmware-imx.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
>  sha256 c115d5d0d115fc14754671bd2428f672f9f99677988588accef2fbca2c3f749c  firmware-imx-8.1.1.bin
> -sha256 fc93f26e4197b9240c327ce26ae6e02123f022423d4704c7b0448a37372cf2a2  EULA
> -sha256 78696664f7afe7f2b081c99af60082d6403fab935b1b10056ed41aec123ff7fa  COPYING
> +sha256 69d19847bac9af7f9e832170a15138f5ef144d8064413434114d75a68982cc9c  EULA
> +sha256 6467f2e81d06b19fe541de49bdba32a9a205e8d1c230220fe24247b48672cb46  COPYING
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
