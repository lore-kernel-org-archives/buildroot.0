From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 20 Mar 2020 21:40:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/boinc: bump version to 7.16.5
In-Reply-To: <20200318212343.307371-1-bernd.kuhls@t-online.de>
References: <20200318212343.307371-1-bernd.kuhls@t-online.de>
Message-ID: <20200320204051.GO10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-03-18 22:23 +0100, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/boinc/boinc.hash | 2 +-
>  package/boinc/boinc.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/boinc/boinc.hash b/package/boinc/boinc.hash
> index 48d61dc919..aa2aebcc4c 100644
> --- a/package/boinc/boinc.hash
> +++ b/package/boinc/boinc.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256 622ce3335a01ef30add4813c0cc7b65cffcaa5500a7f58f77748d0dbc80e6b06  boinc-7.16.3.tar.gz
> +sha256 33db60991b253e717c6124cce4750ae7729eaab4e54ec718b9e37f87012d668a  boinc-7.16.5.tar.gz
>  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
>  sha256 a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
> diff --git a/package/boinc/boinc.mk b/package/boinc/boinc.mk
> index 827eaa0c84..b6a9374715 100644
> --- a/package/boinc/boinc.mk
> +++ b/package/boinc/boinc.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  BOINC_VERSION_MAJOR = 7.16
> -BOINC_VERSION = $(BOINC_VERSION_MAJOR).3
> +BOINC_VERSION = $(BOINC_VERSION_MAJOR).5
>  # client_release can be used to build the Client and Manager but not the Server
>  # part. The Server currently has no versioning (see
>  # https://github.com/BOINC/boinc/pull/1798).
> -- 
> 2.25.0
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
