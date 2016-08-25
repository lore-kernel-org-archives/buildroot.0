From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Aug 2016 20:58:12 +0200
Subject: [Buildroot] [PATCH] package/uboot-tols: fix dependency of
 comment about FIT support
In-Reply-To: <CAOMZO5A8Q=BkaNRuu=err=_mGfSe2phbz41nsbVLQCuRX0tDjA@mail.gmail.com>
References: <1472150751-29450-1-git-send-email-yann.morin.1998@free.fr>
 <CAOMZO5A8Q=BkaNRuu=err=_mGfSe2phbz41nsbVLQCuRX0tDjA@mail.gmail.com>
Message-ID: <20160825185811.GA5762@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2016-08-25 15:50 -0300, Fabio Estevam spake thusly:
> On Thu, Aug 25, 2016 at 3:45 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > When commit 031130a4 added the dependency on sharedlibs for FIT support
> > in uboot-tools, the dependency of the comment was added exactly as the
> > dependency of the symbol.
> >
> > That means the comment is shown when FIT support is possible, and hidden
> > when it is not, while we want it the other way around...
> >
> > Fix the dependency.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> There is a typo in the Subject line: u-boot-tols.

Damn, I am really bad at writing subject lines these days... :-/ The heat
is claiming its /toll/ on me. Damn, it's not even what I wrote... :-)

(However, the package in Buildroot is really named "uboot-tools", with
no dash between 'u' and 'boot'.)

Thanks for spotting!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
