From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Dec 2013 00:09:00 +0100
Subject: [Buildroot] [PATCH] Makefile: defconfig: use BR2_DEFCONFIG only
 when the file exists
In-Reply-To: <CAHkwnC8m5zDM-Q1UDg7kNR+orzvnhr8q1+Mxn3OEbB1hp+Xkgw@mail.gmail.com>
References: <1369922260-8237-1-git-send-email-fabio.porcedda@gmail.com>
 <20130530160109.7c07ecf1@skate>
 <CAHkwnC8m5zDM-Q1UDg7kNR+orzvnhr8q1+Mxn3OEbB1hp+Xkgw@mail.gmail.com>
Message-ID: <20131226230900.GE3398@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, Thomas, All,

On 2013-05-30 16:25 +0200, Fabio Porcedda spake thusly:
> On Thu, May 30, 2013 at 4:01 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Dear Fabio Porcedda,
> >
> > On Thu, 30 May 2013 15:57:40 +0200, Fabio Porcedda wrote:
> >> This is to be able to use "make defconfig" even when BR2_DEFCONFIG has
> >> a filename that does not exist or use the default value that
> >> does not exists.
> >>
> >> Example on a clean installation, without a "./defconfig":
> >>    make defconfig
> >>    make defconfig
> >
> > I'm not sure to understand the example here. Could you detail a little
> > bit?
> 
> Without this patch the first "make defconfig" works, but the second
> "make defconfig" fails.
> With this patch the second "make defconfig" works like the first one.

I think I have a better fix for this:
    http://patchwork.ozlabs.org/patch/305312/

So I'm marking your patch as superseded.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
