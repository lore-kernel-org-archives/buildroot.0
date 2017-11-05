From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 22:22:20 +0100
Subject: [Buildroot] [PATCH 2/2] package/freerdp: always uses pkg-config
In-Reply-To: <CAHXCMMJuTNZJhqOBdjAP3zfAQ2heOXoq+qscLXwKFy8GE8oYmw@mail.gmail.com>
References: <cover.1509907598.git.yann.morin.1998@free.fr>
 <f3ea53ecff0ea344fcc64197b75f4ee5be1ac09c.1509907598.git.yann.morin.1998@free.fr>
 <CAHXCMMJuTNZJhqOBdjAP3zfAQ2heOXoq+qscLXwKFy8GE8oYmw@mail.gmail.com>
Message-ID: <20171105212220.GD10472@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-11-05 22:17 +0100, Samuel Martin spake thusly:
> On Sun, Nov 5, 2017 at 7:46 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Currently, we only deopend on host-pkgconf for gstreamer-0.x
> >
> > However, we also need it at least for gstreamer-1.x and waylabnd, too.
> >
> > Make it a mandatory dependency, no matter what.
> 
> Since freerdp uses the cmake infrastructure, it already has
> host-pkgconf among its dependencies (c.f. [1])

OK, god to know, indeed...

Then, that does not explain the errors we're seeing... Damned... :-(

I'll update the patch to just drop the depenency altogether, then.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
