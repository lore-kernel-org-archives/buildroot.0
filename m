From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 22:26:14 +0100
Subject: [Buildroot] [PATCH] polkit: bump to version 0.104
In-Reply-To: <1361468671-9589-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1361468671-9589-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <201302212226.14845.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 21 February 2013 Stefan Fr?berg wrote:
> Polkit 0.104.
  ^^^
Useless line.

> Also some minor configuration fixes and patch to enable building
> with uClibc.
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> ---
>  package/polkit/polkit-0.104-uclibc-netgroup.patch |   41 +++++++++++++++++++++
>  package/polkit/polkit.mk                          |    6 ++-
>  2 files changed, 45 insertions(+), 2 deletions(-)
>  create mode 100755 package/polkit/polkit-0.104-uclibc-netgroup.patch
> 
> diff --git a/package/polkit/polkit-0.104-uclibc-netgroup.patch b/package/polkit/polkit-0.104-uclibc-netgroup.patch
> new file mode 100755
> index 0000000..423cc5d
> --- /dev/null
> +++ b/package/polkit/polkit-0.104-uclibc-netgroup.patch

Can't you use:
    POLKIT_PATCH = URL-to-patch

Otherwise:
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
