From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sat, 1 Nov 2014 18:22:54 +0100
Subject: [Buildroot] [PATCH 1/1] xinetd: change to snapshot.debian.org
 and add hash
In-Reply-To: <20141101172032.GD10189@free.fr>
References: <1414859755-33664-1-git-send-email-kaszak@gmail.com>
 <20141101180237.6b82f0f4@free-electrons.com>
 <CABbD_XBrSqZmXw2BuM46dKZYbRyYvTOzP3LZgkMBfx7F=jLkaQ@mail.gmail.com>
 <20141101172032.GD10189@free.fr>
Message-ID: <CABbD_XCUpYvs4Jcbfmy2sqkDCEHLT+Ee8+ic27=u-HvRRpkMtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

I'll send a v2 in minutes.

Best regards,
Karoly

On Sat, Nov 1, 2014 at 6:20 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> K?roly, All,
>
> On 2014-11-01 18:06 +0100, K?roly Kasza spake thusly:
> > I'm not sure, but that seems logical.
> > The sha256 sum from github.com differs from debian.org.
> > Which one to prefer?
>
> Well, I'd say we should switch to the github one.
>
> However, we can't use a hash for those tarballs, since they will be
> generated, and thus are not reproducible (the content *is* the same, but
> not the tarball itself).
>
> Regards,
> Yann E. MORIN.
>
> > Best regards,
> > Karoly
> >
> > On Sat, Nov 1, 2014 at 6:02 PM, Thomas Petazzoni <
> > thomas.petazzoni at free-electrons.com> wrote:
> >
> > > Dear Karoly Kasza,
> > >
> > > On Sat,  1 Nov 2014 17:35:55 +0100, Karoly Kasza wrote:
> > >
> > > >  XINETD_VERSION = 2.3.15
> > > > -XINETD_SITE = http://www.xinetd.org
> > > > +XINETD_SOURCE = xinetd_$(XINETD_VERSION).orig.tar.gz
> > > > +XINETD_SITE =
> > >
> http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/x/xinetd
> > >
> > > Just wondering, isn't https://github.com/xinetd-org/xinetd the new
> > > appropriate upstream site?
> > >
> > > There is even a 2.3.15 release at
> > > https://github.com/xinetd-org/xinetd/releases.
> > >
> > > Thomas
> > > --
> > > Thomas Petazzoni, CTO, Free Electrons
> > > Embedded Linux, Kernel and Android engineering
> > > http://free-electrons.com
> > >
> >
> >
> >
> > --
> >
> > ?dv,
> > KK
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141101/7c89a97d/attachment.html>
