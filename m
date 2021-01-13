From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 13 Jan 2021 22:17:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/c-capnproto: fix tarball hash
In-Reply-To: <20210112181159.12172-1-fontaine.fabrice@gmail.com>
References: <20210112181159.12172-1-fontaine.fabrice@gmail.com>
Message-ID: <20210113211700.GA609249@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-01-12 19:11 +0100, Fabrice Fontaine spake thusly:
> Commit 5b95a5dc27c0d8002c00bda1c867ddea9218087e seems to have made a
> mistake in the tarball hash

Actually, I just re-checked locally, and I indeed still get the hash
currently in the tree.

I will run the build in a Debian 10 image to try and reproduce the
issue.

What distro do you have, and what hash do you get on it?

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/2de9c6c8ce83569d18cc7140ebc60d6fe1aadcbf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/c-capnproto/c-capnproto.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/c-capnproto/c-capnproto.hash b/package/c-capnproto/c-capnproto.hash
> index e215400ce5..493b45c7cd 100644
> --- a/package/c-capnproto/c-capnproto.hash
> +++ b/package/c-capnproto/c-capnproto.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  1e35ef786bd8e418ff04fccb20ac881a87fa2fa76df1cbddc4774e35423bafb8  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br1.tar.gz
> +sha256  6913e2016b89987861566b1d0efe935fee1604bd3fb847cabaef354a9516d57b  c-capnproto-9053ebe6eeb2ae762655b982e27c341cb568366d-br1.tar.gz
>  sha256  27797e6c7dce96675d79ed250584d157b7a86405db6eb6fba9644e6d96d42c57  COPYING
> -- 
> 2.29.2
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
