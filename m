From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 04 Dec 2010 18:17:40 +0100
Subject: [Buildroot] external toolchain and iconv in libglib2.mk
In-Reply-To: <003201cb93d6$8162a080$8427e180$@zuerker.org>
References: <003201cb93d6$8162a080$8427e180$@zuerker.org>
Message-ID: <1291483060.14151.2478.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 04 d?cembre 2010 ? 11:13 -0600, Heiko Zuerker a ?crit :
> Hey,
> 
>  
> 
> I?m using crosstools-ng (configured as external toolchain) with iconv
> support.
> 
>  
> 
> The host-libglib2 compile fails without the line:
> 
> HOST_LIBGLIB2_CONF_OPT += --with-libiconv=gnu
> 
>  
> 
> I?m not sure how to fix this correctly, any suggestions?
> 

Hello Heiko,

It sounds like an host related problem...
Could you give us some more details about the distribution you're
using ?

Regards,

--
Lionel Landwerlin
