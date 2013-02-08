From: hayate <hayatelee@gmail.com>
Date: Fri, 8 Feb 2013 13:04:42 +0800
Subject: [Buildroot] bug report: c++ programs built by toolchain crash
 by seg fault
In-Reply-To: <201302062315.45684.yann.morin.1998@free.fr>
References: <CAJXWAwwHVddYF3StQByTW99aCDksiAwyOa_WdM7AbjGu3i6iJg@mail.gmail.com>
 <20130205084502.6b370422@skate> <201302062315.45684.yann.morin.1998@free.fr>
Message-ID: <CAJXWAwySQ+djoZbRJZNpvz-aS8iRJ23ZCoQ=VhPb8KygeBY5ZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 7, 2013 at 6:15 AM, Yann E. MORIN <yann.morin.1998@free.fr>wrote:

> Hayate, All,
>
> On Tuesday 05 February 2013 Thomas Petazzoni wrote:
> > On Tue, 5 Feb 2013 14:24:55 +0800, hayate wrote:
> > > arm little endian; generic arm; OABI; gcc 4.6.3 with c++ support;
> > > uclibc 0.9.31.1
> >
> > Can you test with EABI?
> >
> > Really OABI is deprecated. It would not be surprising at all that there
> > are issues with OABI.
>
> What I would suggest when using technologies of the previous millenium, is
> to use tools dating from the same era. Use a combo of {binutils,gcc,libc}
> that were current at that time to build your toolchain.
>
> Then, use that toolchain as an external toolchain for Buildroot.


Actually I can build an old toolchain for my system, but I just really want
to use new gcc features (especially C++), if not 4.7, 4.6 is fine.

BTW, I tried crosstool-NG, but there are some building errors I cannot
solve in building glibc or uclibc.

>



Note however that, using too old components might not be possible either,
> as Buildroot expects a toolchain with a sysroot, which is not something
> that was available with now-very-old components.
>
> YMMV, as they say.
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>       |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130208/5f95daa6/attachment-0001.html>
