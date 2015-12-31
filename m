From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Dec 2015 18:28:52 +0100
Subject: [Buildroot] [PATCH 0/84 RFC] all: use 'menuconfig' to group
 sub-options (branch yem/menuconfig)
In-Reply-To: <56847581.6000407@mind.be>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
 <56847581.6000407@mind.be>
Message-ID: <20151231172852.GG3495@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-12-31 01:23 +0100, Arnout Vandecappelle spake thusly:
> On 25-12-15 22:25, Yann E. MORIN wrote:
> > Hello All!
> > 
> > This RFC series is a proposal to cleanup the layout of the menuconfig
> > UI. Although it looks to be pretty long (84 patches), it really is only
> > three different changes :
> > 
> >   - patches 1-6: re-order comments to fix indentation of sub-options;
> >     this can probably be applied without too much discussion, as it is
> >     really only a cleanup;
> > 
> >   - patches 7-35: changes use of 'config'+'menu' into a 'menuconfig'
> >     (the Kconfig keywords) to automatically arrange the sub-options into
> >     sub-menus;
> > 
> >   - patches 36-84: document that packages with 5 or more options should
> >     use sub-menus (with 'menuconfig') to store their sub-options
> >     (patches 36-39); it then changes a lot of packages accordingly
> >     (patches 40-84).
> 
>  I reviewed and tested patches 7-39, you can add my
> 
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thank you for the review. I know by experience that reviewing long
series can be tedious, so: thanks!

> to the ones where I didn't have comments. I didn't bother adding Acks everywhere
> because it's anyway not going to be picked up by Patchwork.

Yep, I sent the series as an RFC, just to "feel the temperature of the
water".

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
