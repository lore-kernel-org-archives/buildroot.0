From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Nov 2020 23:29:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/imlib2: fix md5 and sha1
In-Reply-To: <20201103221303.243146-1-fontaine.fabrice@gmail.com>
References: <20201103221303.243146-1-fontaine.fabrice@gmail.com>
Message-ID: <20201103222939.GM2887157@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-11-03 23:13 +0100, Fabrice Fontaine spake thusly:
> Commit 23a79ddb45ed150cc36ddd3e16a0b5543b0342ad updated md5 and sha1 for
> imlib2_loaders-1.6.1.tar.bz2 instead of imlib2-1.6.1.tar.bz2
> 
> Fix this mistake and, while at it, update indentation to two spaces
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/imlib2/imlib2.hash | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/imlib2/imlib2.hash b/package/imlib2/imlib2.hash
> index 7cfb674906..68f6c91db7 100644
> --- a/package/imlib2/imlib2.hash
> +++ b/package/imlib2/imlib2.hash
> @@ -1,8 +1,8 @@
> -# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.5.1/
> -md5 da6a0b39bc3333f1833c791d96ed75a5  imlib2_loaders-1.6.1.tar.bz2
> -sha1 29bc3c8d75cc8fb3bbd5d61e8ab29940d0943da8  imlib2_loaders-1.6.1.tar.bz2
> +# From https://sourceforge.net/projects/enlightenment/files/imlib2-src/1.6.1/
> +md5  7b3fbcb974b48822b32b326c6a47764b  imlib2-1.6.1.tar.bz2
> +sha1  3b5f850e83cbb7481e33061348fb9c7a555c8c60  imlib2-1.6.1.tar.bz2
>  
>  # Locally computed
> -sha256 4d393a77e13da883c8ee2da3b029da3570210fe37d000c9ac33d9fce751b166d  imlib2-1.6.1.tar.bz2
> -sha256 fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
> -sha256 8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
> +sha256  4d393a77e13da883c8ee2da3b029da3570210fe37d000c9ac33d9fce751b166d  imlib2-1.6.1.tar.bz2
> +sha256  fb70339dd33a77b6213c7ae067fccf93d04af44ff3f937c61f8863f7970e73f6  COPYING
> +sha256  8c9a2e92ed4937e2d30c2ea95439c36ed3002fc47e34efee43455a460fee8ef5  COPYING-PLAIN
> -- 
> 2.28.0
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
