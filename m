From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Aug 2020 22:28:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/{protobuf,
 python-protobuf}: bump to version 3.12.4
In-Reply-To: <20200801214549.1526894-1-james.hilliard1@gmail.com>
References: <20200801214549.1526894-1-james.hilliard1@gmail.com>
Message-ID: <20200802202840.GC2186@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

James, All,

On 2020-08-01 15:45 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied, with the 4 other bumps, to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/protobuf/protobuf.hash               | 2 +-
>  package/protobuf/protobuf.mk                 | 2 +-
>  package/python-protobuf/python-protobuf.hash | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
> index 18bb2ace96..aa9d871561 100644
> --- a/package/protobuf/protobuf.hash
> +++ b/package/protobuf/protobuf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
>  sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> -sha256  f2f180e9343cbb2b9a8482255bfec2176a2cc7fa22de496535a0a0cf38797495  protobuf-cpp-3.12.2.tar.gz
> +sha256  ccfbaaba52f67e0e6536a05f3df3f6618620d255513cfca3a07f5935b624e26b  protobuf-cpp-3.12.4.tar.gz
> diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
> index 08787ef623..04fea3063e 100644
> --- a/package/protobuf/protobuf.mk
> +++ b/package/protobuf/protobuf.mk
> @@ -7,7 +7,7 @@
>  # When bumping this package, make sure to also verify if the
>  # python-protobuf package still works, as they share the same
>  # version/site variables.
> -PROTOBUF_VERSION = 3.12.2
> +PROTOBUF_VERSION = 3.12.4
>  PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
>  PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
>  PROTOBUF_LICENSE = BSD-3-Clause
> diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
> index ad5b51b591..f723d584d1 100644
> --- a/package/python-protobuf/python-protobuf.hash
> +++ b/package/python-protobuf/python-protobuf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  1f9299046b508b528056804fac806e8f429b190526f909288535e4faa37d949a  protobuf-python-3.12.2.tar.gz
> +sha256  ddafee267ec4cfa4b0afc74effd5644a96690036ecd2e310056d317f52e605f4  protobuf-python-3.12.4.tar.gz
>  sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
> -- 
> 2.25.1
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
