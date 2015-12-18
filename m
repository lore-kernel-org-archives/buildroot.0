From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Dec 2015 22:40:21 +0100
Subject: [Buildroot] [PATCH] python-pyxml: remove obsolete package
In-Reply-To: <20151218222828.26ba769f@free-electrons.com>
References: <1450251868-7288-1-git-send-email-yegorslists@googlemail.com>
 <20151218222828.26ba769f@free-electrons.com>
Message-ID: <20151218214021.GG27578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-12-18 22:28 +0100, Thomas Petazzoni spake thusly:
> On Wed, 16 Dec 2015 08:44:28 +0100, yegorslists at googlemail.com wrote:
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> > 
> > PyXML is bitrotten and obsolete. You'll find the functionality it
> > previously provided is now included in the Python standard library.
> > 
> > So no need to keep this package in Buildroot anymore.
> > 
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  package/Config.in                      |  1 -
> >  package/python-pyxml/Config.in         | 12 ------------
> >  package/python-pyxml/python-pyxml.hash |  2 --
> >  package/python-pyxml/python-pyxml.mk   | 17 -----------------
> >  4 files changed, 32 deletions(-)
> >  delete mode 100644 package/python-pyxml/Config.in
> >  delete mode 100644 package/python-pyxml/python-pyxml.hash
> >  delete mode 100644 package/python-pyxml/python-pyxml.mk
> 
> As Yann said, can you respin this patch after taking care of
> Config.in.legacy handling ?
> 
> Or maybe instead of removing the package we should mark it as
> deprecated ?

I usually agree that we first mark package as being deprecated before we
get rid of them.

However, python-pyxml is so old, its features have long been incoporated
into python stdlib. Probably not many people are using it, if any at
all.

So, I'd vote in favour of just removing it altogether right now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
