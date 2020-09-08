From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Sep 2020 23:29:58 +0200
Subject: [Buildroot] [PATCH 2020.02.x 1/4] package/systemd: bump version
 to 244.4
In-Reply-To: <20200908211313.107946-1-brandon.maier@rockwellcollins.com>
References: <20200908211313.107946-1-brandon.maier@rockwellcollins.com>
Message-ID: <20200908212958.GC14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brandon, All,

On 2020-09-08 16:13 -0500, Brandon Maier spake thusly:
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> ---
>  package/systemd/systemd.hash | 2 +-
>  package/systemd/systemd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> index 4ab514d673..3f6f4b4db6 100644
> --- a/package/systemd/systemd.hash
> +++ b/package/systemd/systemd.hash
> @@ -1,5 +1,5 @@
>  # sha256 locally computed
> -sha256	e6b463733da5eb37075352a64112d030b8612935a54e5b3468279a4f15a4cec4	systemd-244.3.tar.gz
> +sha256	6f01276f45369d56ea5ced713e63a22acbb9142862eb719246a77a4b3f5699ee	systemd-244.4.tar.gz
>  sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6	LICENSE.GPL2
>  sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	LICENSE.LGPL2.1
>  sha256	f7299f5f5e8bdffd347dce1bed888b1cea6ddaf27de521c307265098bcbeae92	README
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 2908caef61..e0a4679955 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSTEMD_VERSION = 244.3
> +SYSTEMD_VERSION = 244.4

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
>  SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
>  SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
