From: Lucian Buga <lucianbuga@gmail.com>
Date: Sun, 3 May 2020 17:02:46 +0300
Subject: [Buildroot] [PATCH] package/kmod - fix host build dependecies
In-Reply-To: <20200503123748.GZ15673@scaer>
References: <20200503075401.GU15673@scaer>
 <D9E5771A-69D4-4D5F-98AB-8E408976E4CB@gmail.com>
 <20200503121101.GX15673@scaer> <20200503122019.GY15673@scaer>
 <20200503123748.GZ15673@scaer>
Message-ID: <CABaB-BJO5=H3VchcjVNT-LfEgxmmJsgp-+iHghk3oLckQViELA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

>
> I'll have to test this a bit, but you can already have a peek at the
> 2-patch series:
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/host-kmod-z
>

I think your suggested patches will fix the issue.

Thank you and regards,
Lucian Buga


On Sun, May 3, 2020 at 3:37 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Lucian, All,
>
> On 2020-05-03 14:20 +0200, Yann E. MORIN spake thusly:
> > On 2020-05-03 14:11 +0200, Yann E. MORIN spake thusly:
> > > On 2020-05-03 12:13 +0300, Lucian Buga spake thusly:
> > > > To be more precise, the patch fixes the host depmod utility from kmod
> > > > package.
> > [--SNIP--]
> > > Please, could you have a look at the branch I linked to earlier, to see
> > > if it would fir your needs:
> > >
> https://git.buildroot.org/~ymorin/git/buildroot/log?h=yem/host-kmod
> >
> > In fact I just thought of a much simpler solution. I'll send a patch
> > series shortly...
>
> I'll have to test this a bit, but you can already have a peek at the
> 2-patch series:
>     https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/host-kmod-z
>
> I'll be doing better commit logs, and will push that later today after I
> test it further. But you may still have a look and provide some feedback
> (if you want to test on your side too).
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
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200503/40177d2e/attachment.html>
