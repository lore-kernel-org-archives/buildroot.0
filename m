From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jan 2014 22:10:50 +0100
Subject: [Buildroot] [PATCH] BR2_EXTERNAL: check it is a valid
 BR2_EXTERNAL dir before using it
In-Reply-To: <1880877953.4607498.1390394593186.JavaMail.root@openwide.fr>
References: <1410002893.284525363.1390386070110.JavaMail.root@zimbra96-e16.priv.proxad.net>
 <1880877953.4607498.1390394593186.JavaMail.root@openwide.fr>
Message-ID: <20140122211050.GC3592@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?my, All,

On 2014-01-22 13:43 +0100, Jeremy Rosen spake thusly:
> my remark about the error message still not being clean still stands
> 
> and the doc is not explicit about Config.in and external.mk being 
> required

Hopefully, my new series will address those two points.

> if you don't want to add these to your patch I can post a separate
> one, but for the technical part :
> 
> Tested-by: J?r?my Rosen <jeremy.rosen@openwide.fr>

Thank you!

I haven't included your Tested-by in the new series, though, since I've
modified it more than a bit. Care to have a quick look?

Thanks for the feedback! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
