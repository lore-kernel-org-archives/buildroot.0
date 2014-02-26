From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 26 Feb 2014 19:03:38 +0100
Subject: [Buildroot] [RFC PATCH 0/10] add new virtual-package
 infrastructure
In-Reply-To: <CAB0FRssWBtzFimD0JShSj8Y7efvUWk4Ono_cgSxqw0uMLk0PTg@mail.gmail.com>
References: <cover.1393365231.git.yann.morin.1998@free.fr>
 <CAB0FRssWBtzFimD0JShSj8Y7efvUWk4Ono_cgSxqw0uMLk0PTg@mail.gmail.com>
Message-ID: <20140226180338.GA3348@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-02-26 09:23 +0100, Fran?ois Perrad spake thusly:
> 2014-02-25 23:02 GMT+01:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Here is a quick series implementing a new infrastructure for virtual
> > packages.
> could you check your new infrastructure with these 2 patches :
>  http://patchwork.ozlabs.org/patch/323464/
>  http://patchwork.ozlabs.org/patch/323465/
> because for the first time, a virtual package is used on host and target side.

This was just a quick proof-of-concept implementation, mostly targeted
at getting some feedback on the global idea.

I based this ontop of master because I forgot to checkout next first,
and rebasing ontop of -next uncovered some merge conflicts, so I just
aborted the rebase. It will need a bit of love before it is ready.

So, yes, it may be impacted by patches applied on -next, or even patches
pending in Patchwork.

> Note that the definition of LUAINTERPRETER_SOURCE is not enough,
> the definition of HOST_LUAINTERPRETER_SOURCE is required too.

Ah, so we will need to handle the case for host-virtual-packages, too?
I just did not bother doign so for this first rough draft.

Thanks for the report! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
