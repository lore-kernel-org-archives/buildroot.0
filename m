From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Mar 2021 22:09:52 +0100
Subject: [Buildroot] [PATCH v1 2/2] package/batman-adv: bump version to
 2021.0
In-Reply-To: <20210311210804.9616-2-ps.report@gmx.net>
References: <20210311210804.9616-1-ps.report@gmx.net>
 <20210311210804.9616-2-ps.report@gmx.net>
Message-ID: <20210316210952.GG3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-11 22:08 +0100, Peter Seiderer spake thusly:
> For details see [1].
> 
> [1] https://www.open-mesh.org/news/100
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Now that the issue has been resolved with your other patches: applied to
master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/batman-adv/batman-adv.hash | 10 +++++-----
>  package/batman-adv/batman-adv.mk   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/batman-adv/batman-adv.hash b/package/batman-adv/batman-adv.hash
> index dabbec8120..2422723f40 100644
> --- a/package/batman-adv/batman-adv.hash
> +++ b/package/batman-adv/batman-adv.hash
> @@ -1,7 +1,7 @@
> -# From https://downloads.open-mesh.org/batman/stable/sources/batman-adv/batman-adv-2019.3.tar.gz.{md5,sha1}
> -md5  39345688ddf12a542853b2318325f07b         batman-adv-2019.3.tar.gz
> -sha1 202539c0cbf4604f6c8e9d427b338d4e807bd220 batman-adv-2019.3.tar.gz
> +# From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.0/batman-adv-2021.0.tar.gz.sha1
> +sha1  7edd4dfb9434f80adf791990d4e383c7ef80a256  batman-adv-2021.0.tar.gz
>  
>  # Hash for license files
> -sha256 cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025 LICENSES/preferred/GPL-2.0
> -sha256 323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f LICENSES/preferred/MIT
> +sha256  5a989ba580897268373bd516b87b588061f344af773a0f6b038a3d8d2af028a1  batman-adv-2021.0.tar.gz
> +sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
> +sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
> diff --git a/package/batman-adv/batman-adv.mk b/package/batman-adv/batman-adv.mk
> index 3f48e62051..bd648b5a6c 100644
> --- a/package/batman-adv/batman-adv.mk
> +++ b/package/batman-adv/batman-adv.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BATMAN_ADV_VERSION = 2019.3
> +BATMAN_ADV_VERSION = 2021.0
>  BATMAN_ADV_SITE = https://downloads.open-mesh.org/batman/stable/sources/batman-adv
>  BATMAN_ADV_LICENSE = GPL-2.0, MIT (batman_adv.h)
>  BATMAN_ADV_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
> -- 
> 2.30.1
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
