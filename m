From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 12:35:43 +0200
Subject: [Buildroot] [PATCH 3/3] expect: bump to version 5.45.3
In-Reply-To: <CAHkwnC_X6OCfau4QcN1=rvF7VV3vXHg1pYcYUutBD9m6qkoqVw@mail.gmail.com>
References: <1429376067-9228-1-git-send-email-fabio.porcedda@gmail.com>
 <1429376067-9228-4-git-send-email-fabio.porcedda@gmail.com>
 <20150419081148.GC4313@free.fr>
 <CAHkwnC_X6OCfau4QcN1=rvF7VV3vXHg1pYcYUutBD9m6qkoqVw@mail.gmail.com>
Message-ID: <20150419103543.GG4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2015-04-19 12:12 +0200, Fabio Porcedda spake thusly:
> On Sun, Apr 19, 2015 at 10:11 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2015-04-18 18:54 +0200, Fabio Porcedda spake thusly:
[--SNIP--]
> >> +EXPECT_VERSION = 2014/05/02 # v5.45.3
> >
> > Do not put comments after the variable definition, it breaks things.
> 
> Could you explain it?

I'm not sure what's going on here, but we've observed failures with
that, most notably when downloading via git, and removing the comment
made the error vanish.

One wild guess is that the space(s) between the version and the '#' are
part of the value, and that breaks later on. Really, just a wild
guess...

> > Note that the example we have in the manual is wrong. Care to address
> > that as well, please?
> 
> Sure

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
