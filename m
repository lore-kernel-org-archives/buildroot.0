From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 May 2015 18:21:13 +0200
Subject: [Buildroot] [PATCH 3/7] boot/uboot: do not check hash for
 custom versions
In-Reply-To: <5543A044.30604@mind.be>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <12d715d71a908668d9156cfb3c0a0de1966bea66.1430260630.git.yann.morin.1998@free.fr>
 <55437C36.6020707@mind.be> <20150501153117.GB4206@free.fr>
 <5543A044.30604@mind.be>
Message-ID: <20150501162113.GE4206@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-01 17:48 +0200, Arnout Vandecappelle spake thusly:
> On 01/05/15 17:31, Yann E. MORIN wrote:
[--SNIP--]
> > Acutally, I prefer we explicitly exclude only what we really want to be
> > excluded.
[--SNIP--]
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks! :-)

> >> Actually, before patch 2/7, the VCS cases wouldn't
> >> even be added because UBOOT_SOURCE is not set yet at that point :-)
> > 
> > Well, in my patch, it is set a few lines above. And patch 2 is already
> > applied! ;-)
> 
>  Is it? Or do you mean patch 1?

Well, I meant "patch 2 is applied in the series, before this one patch",
so your proposal was OK.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
