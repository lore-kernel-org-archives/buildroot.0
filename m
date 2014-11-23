From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Nov 2014 14:33:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: Fix static build
In-Reply-To: <XnsA3EE92FA316C4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1416748839-5316-1-git-send-email-bernd.kuhls@t-online.de>
 <XnsA3EE92FA316C4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141123133350.GA4151@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All!

On 2014-11-23 14:26 +0100, Bernd Kuhls spake thusly:
> Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
> news:1416748839-5316-1-git-send-email-bernd.kuhls at t-online.de:
> > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> > +NFS_UTILS_CONF_ENV += LIBS="-lpthread"
> > +endif
> 
> lol,

Indeed! That's pretty funny! :-)

> Yann and I had the same thought, but his patch is better, therefore I 
> marked mine as superseded in patchworks ;)

However, your patch is much simpler, and might be considered sufficient
for the release.

So I would not have been so prompt as to mark it in Patchwork.

Peter, Thomas, what's your preference?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
