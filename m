From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Feb 2016 18:37:41 +0100
Subject: [Buildroot] [PATCH 0/8] package/links: With or without you ;)
In-Reply-To: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455986411-14273-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160220173741.GF3418@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernds, All,

Aha, I see I'm not the only one providing little jokes in the commit
logs/titles! Thanks for the good laugh! ;-)

On 2016-02-20 17:40 +0100, Bernd Kuhls spake thusly:
> this patch series adds --with/--without to CONF_OPTS as requested by
> Thomas: http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/140285
> 
> Regards, Bernd
> 
> Bernd Kuhls (8):
>   package/links: add --with/--without-zlib
>   package/links: add --with/--without-lzma
>   package/links: add --with/--without-ssl
>   package/links: add --with/--without-libevent
>   package/links: add --with/--without-bzip2
>   package/links: add --with/--without-libtiff
>   package/links: add --disable-graphics
>   package/links: add --with/--without-libjpeg

I'll be reviewing those in a moment...

Regards,
Yann E. MORIN.

>  package/links/links.mk | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> -- 
> 2.7.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
