From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Mar 2021 22:09:08 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/batctl: bump version to
 2021.0
In-Reply-To: <20210311210804.9616-1-ps.report@gmx.net>
References: <20210311210804.9616-1-ps.report@gmx.net>
Message-ID: <20210316210908.GF3443324@scaer>
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

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/batctl/batctl.hash | 6 +++---
>  package/batctl/batctl.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
> index e8127aa26f..56bea3c5da 100644
> --- a/package/batctl/batctl.hash
> +++ b/package/batctl/batctl.hash
> @@ -1,6 +1,6 @@
> -# From https://downloads.open-mesh.org/batman/releases/batman-adv-2020.2/batctl-2020.2.tar.gz.sha1
> -sha1  e347fb126e2a8f6d21516296325afc043062e3bd  batctl-2020.2.tar.gz
> +# From https://downloads.open-mesh.org/batman/releases/batman-adv-2021.0/batctl-2021.0.tar.gz.sha1
> +sha1  87d0bb34950cb70578a0ca5ce706513a8279a01c  batctl-2021.0.tar.gz
>  # Locally calculated
> -sha256  d29cdb53ee68abd5027eae07d9fd645b3f154e0d577efa2666c1334bb6d60efd  batctl-2020.2.tar.gz
> +sha256  9cec8bf1952f885192749a9dc0318a54633b717aaf05c438d504efd83f5201e4  batctl-2021.0.tar.gz
>  sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
>  sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/preferred/MIT
> diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
> index 229c042aaf..8ff591844d 100644
> --- a/package/batctl/batctl.mk
> +++ b/package/batctl/batctl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BATCTL_VERSION = 2020.2
> +BATCTL_VERSION = 2021.0
>  BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
>  BATCTL_LICENSE = GPL-2.0, MIT (batman_adv.h, list.h)
>  BATCTL_LICENSE_FILES = LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT
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
