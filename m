From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 7 Mar 2012 22:52:46 +0100
Subject: [Buildroot] [RFC v2 19/31] bzip2: define license
In-Reply-To: <1331153911-22277-20-git-send-email-luca@lucaceresoli.net>
References: <1331153911-22277-1-git-send-email-luca@lucaceresoli.net>
 <1331153911-22277-20-git-send-email-luca@lucaceresoli.net>
Message-ID: <201203072252.46180.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 07 March 2012 21:58:19 Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/bzip2/bzip2.mk |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/package/bzip2/bzip2.mk b/package/bzip2/bzip2.mk
> index 1bc4449..028c2f2 100644
> --- a/package/bzip2/bzip2.mk
> +++ b/package/bzip2/bzip2.mk
> @@ -7,6 +7,8 @@ BZIP2_VERSION:=1.0.5
>  BZIP2_SONAME=1.0.4
>  BZIP2_SOURCE:=bzip2-$(BZIP2_VERSION).tar.gz
>  BZIP2_SITE:=http://www.bzip.org/$(BZIP2_VERSION)
> +BZIP2_LICENSE = BSD-like

I think it makes sense to have:

  value         meaning
  -------------------------------
  BSD-4c        Original BSD 4-clause
  BSD           Alias for the above
  BSD-3c        BSD 3-clause
  BSD-2c        BSD 2-clause

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
