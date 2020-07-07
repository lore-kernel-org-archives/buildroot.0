From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Jul 2020 21:59:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/valijson: bump version to 0.3
In-Reply-To: <1594127214-26135-1-git-send-email-santosh.multhalli@rockwellcollins.com>
References: <1594127214-26135-1-git-send-email-santosh.multhalli@rockwellcollins.com>
Message-ID: <20200707195933.GQ2273@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Santosh, All,

On 2020-07-07 18:36 +0530, Santosh Multhalli spake thusly:
> - Updated hash of valijson tar file in valijson.hash file

It was not very interesting to have that in the commit log, because it
is obvious that you had to update the hash file, just by reading the
diff.

So I just dropped that sentence, and applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
> ---
>  package/valijson/valijson.hash | 2 +-
>  package/valijson/valijson.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
> index 6f11000..e184ccb 100644
> --- a/package/valijson/valijson.hash
> +++ b/package/valijson/valijson.hash
> @@ -1,3 +1,3 @@
>  # Locally Computed:
> -sha256  77dbebb40dab2e834557c2fcc39122cdb2d0fe26bf591c2b3e0df5a316a45592  valijson-0.2.tar.gz
> +sha256  2ac881a36f90810b41b66511502dea1e7886137ad31bcfb4e917d929c5028c35  valijson-0.3.tar.gz
>  sha256  1a0f99926a2dbec30eba3db820236d9953fbe3048976923ac24980e655fbe991  LICENSE
> diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
> index 31efeed..b38c631 100644
> --- a/package/valijson/valijson.mk
> +++ b/package/valijson/valijson.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -VALIJSON_VERSION = 0.2
> +VALIJSON_VERSION = 0.3
>  VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
>  VALIJSON_LICENSE = BSD-2-Clause
>  VALIJSON_LICENSE_FILES = LICENSE
> -- 
> 2.5.0
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
