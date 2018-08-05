From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Aug 2018 08:54:51 +0200
Subject: [Buildroot] [PATCH 1/3] docs/manual: add flex+bison to
 pre-requisites
In-Reply-To: <20180805042552.kegqkwiff37nm4rh@sapphire.tkos.co.il>
References: <cover.1533333972.git.yann.morin.1998@free.fr>
 <e46b168daba5486329166279765dcbdb51bd3787.1533333972.git.yann.morin.1998@free.fr>
 <20180805042552.kegqkwiff37nm4rh@sapphire.tkos.co.il>
Message-ID: <20180805065451.GA12445@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2018-08-05 07:25 +0300, Baruch Siach spake thusly:
> On Sat, Aug 04, 2018 at 12:06:18AM +0200, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > ---
> >  docs/manual/prerequisite.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
> > index 110fab41fd..0867e4d619 100644
> > --- a/docs/manual/prerequisite.txt
> > +++ b/docs/manual/prerequisite.txt
> > @@ -24,7 +24,8 @@ between distributions).
> >  ** +binutils+
> >  ** +build-essential+ (only for Debian based systems)
> >  ** +gcc+ (version 2.95 or any later)
> > -** `g++` (version 2.95 or any later)
> 
> Is this removal intended?

Nope, that was not intentional.

> BTW, is version 2.95 realistic? Is it actually possible to build a reasonable 
> Buildroot config even with host gcc 3.x?

Probably not, but that is a brand other topic...

Thanks! :-)

Regards,
Yann E. MORIN.

> > +** `bison`
> > +** `flex`
> >  ** +bash+
> >  ** +patch+
> >  ** +gzip+
> 
> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
