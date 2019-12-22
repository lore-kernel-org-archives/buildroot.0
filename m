From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 14:00:38 +0100
Subject: [Buildroot] [PATCH] package/open2300: add hash file
In-Reply-To: <CAEyMn7ap+MRO=-fUv5uH8fOvZ9_MqHc9pb0hQuHhfyfajVpNsg@mail.gmail.com>
References: <20191222083707.3448-1-heiko.thiery@gmail.com>
 <20191222105754.188b7bd2@windsurf> <20191222100801.GR26395@scaer>
 <CAEyMn7aQSNzWDyPLi_g3mn+9Ze5ZxDYJ+mWp4m4TTMHUY6jrxg@mail.gmail.com>
 <20191222110534.GA26395@scaer>
 <CAEyMn7ap+MRO=-fUv5uH8fOvZ9_MqHc9pb0hQuHhfyfajVpNsg@mail.gmail.com>
Message-ID: <20191222130038.GC26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2019-12-22 13:50 +0100, Heiko Thiery spake thusly:
> Am So., 22. Dez. 2019 um 12:05 Uhr schrieb Yann E. MORIN
> <yann.morin.1998@free.fr>:
> > The subversion backend would need some love for that, so if you have a
> > bit of time on your hnads, that's be nice if you could tackle it (if
> > you're interested).
> 
> If I will get the time I can take a look on. Is this implemented in
> the dl-wrapper and co? And should it be treated like the git one?

It's handled in each backend. See for example how it's done in the git
backend, in support/download/git, lines 181 thhrough 196.

Regards,
Yann E. MORIN.

> > > By the way ... what does s.b.o mean?
> >
> > Sources.Buildroot.Org, our fallback mirror:
> >
> >     http://sources.buildroot.org/
> >
> > Regards,
> > Yann E. MORIN.
> >
> > > > Regards,
> > > > Yann E. MORIN.
> > > >
> > > > --
> > > > .-----------------.--------------------.------------------.--------------------.
> > > > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > > > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > > > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > > > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > > > '------------------------------^-------^------------------^--------------------'
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
