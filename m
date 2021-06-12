From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:16:39 +0200
Subject: [Buildroot] [PATCH 1/1] boot/edk2: add EDK2_CPE_ID_VENDOR
In-Reply-To: <20210612143835.522308-1-fontaine.fabrice@gmail.com>
References: <20210612143835.522308-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612211638.GE168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 16:38 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:tianocore:edk2 is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atianocore%3Aedk2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/edk2/edk2.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
> index 903fdfb89e..fabd0c5b45 100644
> --- a/boot/edk2/edk2.mk
> +++ b/boot/edk2/edk2.mk
> @@ -9,6 +9,7 @@ EDK2_SITE = https://github.com/tianocore/edk2
>  EDK2_SITE_METHOD = git
>  EDK2_LICENSE = BSD-2-Clause
>  EDK2_LICENSE_FILE = License.txt
> +EDK2_CPE_ID_VENDOR = tianocore
>  EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
>  EDK2_INSTALL_TARGET = NO
>  EDK2_INSTALL_IMAGES = YES
> -- 
> 2.30.2
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
