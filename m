From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Mar 2012 22:49:40 +0100
Subject: [Buildroot] [RFC v2 16/31] linux: define license
In-Reply-To: <1331153911-22277-17-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <1331153911-22277-17-git-send-email-luca@lucaceresoli.net>
Message-ID: <201203072249.40319.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lucas, All,

On Wednesday 07 March 2012 21:58:16 Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  linux/linux.mk |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index ae236d4..e6f2388 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -4,6 +4,8 @@
>  #
>  ###############################################################################
>  LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
> +LINUX_LICENSE = GPLv2-ONLY

What's the point of giving the version 'v2' and stating 'only'?
I would rather see:
  values        meaning
  -------------------------------
  GPLv2         GPLv2 only
  GPLv2+        GPLv2 or later
  LGPLv2.1      LGPLv2.1 only
  LGPLv2.1+     LGPLv2.1 or later
  ...           ...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
