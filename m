From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Mar 2021 23:21:30 +0100
Subject: [Buildroot] [PATCH v1] package/sysvinit: bump version to 2.99
In-Reply-To: <20210312221704.4521-1-ps.report@gmx.net>
References: <20210312221704.4521-1-ps.report@gmx.net>
Message-ID: <20210312222130.GH2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-12 23:17 +0100, Peter Seiderer spake thusly:
> Changelog according to [1]:
> 
>   sysvinit (2.99) released; urgency=low
>     * Fixed typos and missing underlines in shutdown manual page.
>       Corrections provided by Helge Kreutzmann.
> 
> [1] https://fossies.org/linux/sysvinit/doc/Changelog
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sysvinit/sysvinit.hash | 2 +-
>  package/sysvinit/sysvinit.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
> index 24e5333d23..5b3c7837e2 100644
> --- a/package/sysvinit/sysvinit.hash
> +++ b/package/sysvinit/sysvinit.hash
> @@ -1,5 +1,5 @@
>  # Locally computed:
> -sha256	7b2c3ffaf19eaf1ca80268762f85f9e4eb8e3c973213d49f9802605b72caa7dc  sysvinit-2.98.tar.xz
> +sha256	b05c3677bb698afe64c997968b00c49b2a9bd320ce963523230ee7ea41197757  sysvinit-2.99.tar.xz
>  
>  # Hash for license files:
>  sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
> index c7ddf67c2f..72cf313f25 100644
> --- a/package/sysvinit/sysvinit.mk
> +++ b/package/sysvinit/sysvinit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSVINIT_VERSION = 2.98
> +SYSVINIT_VERSION = 2.99
>  SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
>  SYSVINIT_SITE = http://download.savannah.nongnu.org/releases/sysvinit
>  SYSVINIT_LICENSE = GPL-2.0+
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
