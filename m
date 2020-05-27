From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 May 2020 21:52:26 +0200
Subject: [Buildroot] [PATCH] linux: fix COPYING file hash
In-Reply-To: <20200527094911.29739-1-yegorslists@googlemail.com>
References: <20200527094911.29739-1-yegorslists@googlemail.com>
Message-ID: <20200527195225.GM8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2020-05-27 11:49 +0200, yegorslists at googlemail.com spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> In version 5.6 a minor change was made to this file and hence
> the checksum has changed.

I've expanded the commit log to explain what changed exactly, and why we
can apply it even though the kernel can have various version chosen by
the user.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  linux/linux.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/linux.hash b/linux/linux.hash
> index b70c8a8173..88edd2f400 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -12,6 +12,6 @@ sha256  ea53913813cb5a9069608532b327de7a7ed0fdc8fed8c6f10cd55d1ac6a58ffb  linux-
>  sha256  7f0a0db0e1cfb14053523f4432f1ad1468b5bd42305b44905c4b103466c8d655  linux-cip-4.19.115-cip24-rt9.tar.gz
>  
>  # Licenses hashes
> -sha256  ee5808b032a67f587d3541099d46de34f5bec8cd5976114ba07f1299ee6001ff  COPYING
> +sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
>  sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
>  sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
> -- 
> 2.17.0
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
