From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 May 2021 14:01:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston: add configuration
 options for weston shells
In-Reply-To: <4238f9b6-4ea4-1529-e050-09db00cc0e5c@theobroma-systems.com>
References: <20210511154006.630376-1-martin.elshuber@theobroma-systems.com>
 <20210519101415.GQ2268078@scaer>
 <4238f9b6-4ea4-1529-e050-09db00cc0e5c@theobroma-systems.com>
Message-ID: <20210528120152.GC2788252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2021-05-28 12:54 +0200, Martin Elshuber spake thusly:
> On 19/05/2021 12:14, Yann E. MORIN wrote:
> > On 2021-05-11 17:40 +0200, Martin Elshuber spake thusly:
> >> Enable selection of used weston shells. By default all available
> >> shells are enabled to keep the old behavior. The new configuration
> >> options enable the user to select them individually.
> > Don't we have to ensure that at least one is enabled, or is it valid to
> > disable all of them?
> I think it makes sense to allow disabling all shells, since one might
> want to add its own, non default, implementaion.
> I this case the user might want disable all shells that are included in
> the weston package.

I see your point. But then, people writting their own are also probably
be writteing their entire compositor too, probably...

But otherwise, you have a point anyway.

> I suggest to add a help comment:
> help
> ? if unsure say yes

That has never prevented people from saying 'n' even when they don't
know. You can't prevent anyone from shooting themselves in the foot. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
