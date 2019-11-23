From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 23 Nov 2019 22:27:18 +0100
Subject: [Buildroot] [PATCH v2] [next,
 master] package/systemd: bump to v243.4
In-Reply-To: <20191119202335.1845202-1-jeremy.rosen@smile.fr>
References: <20191119202335.1845202-1-jeremy.rosen@smile.fr>
Message-ID: <20191123212718.GB32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2019-11-19 21:23 +0100, J?r?my Rosen spake thusly:
> upstream systemd-stable has started tagging point releses, so bump
> to the latest

Applied to master,after I expanded the commit log with thev243.3
version. Thanks!

Note that I haven;t applied to next, because this does not seem to bring
build-time fixes. We usually do not commit both to next and master.

Regards,
Yann E. MORIN.

> Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
> ---
>  package/systemd/systemd.hash | 2 +-
>  package/systemd/systemd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 46055aa035..4c126d3755 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256	d9cb11fab907292c61f66ef8ad2d9a68054c0e8856bd47cd2b0a12b2255da771  	systemd-243-78-gef677436aa.tar.gz
> +sha256	281bc47aa6b173c3c6fa1bbc88aea84ecb014313aeb679c54f8885dd09e434be	systemd-243.4.tar.gz
>  sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
>  sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
>  sha256	3a3b3cbd0ef03c7045bfda9b61062bdc33ad4913b44a6b6147043f26d00b51bf	README
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 92490eb86b..ebec9bdd91 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSTEMD_VERSION = 243-78-gef677436aa
> +SYSTEMD_VERSION = 243.4
>  SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README)
>  SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README
> -- 
> 2.24.0
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
