From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Dec 2015 23:06:28 +0100
Subject: [Buildroot] [PATCH] python-pyxml: add a patch to fix syntax
 errors
In-Reply-To: <CAGm1_kswNpWvuHbQvTN39bn6BaWtoRAv=o4FgPrdk19ZGc=W_A@mail.gmail.com>
References: <1450094225-4625-1-git-send-email-yegorslists@googlemail.com>
 <20151214140330.2904ec0b@free-electrons.com>
 <20151215210413.GC3596@free.fr>
 <CAGm1_kswNpWvuHbQvTN39bn6BaWtoRAv=o4FgPrdk19ZGc=W_A@mail.gmail.com>
Message-ID: <20151215220628.GD3596@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor, All,

On 2015-12-15 23:03 +0100, Yegor Yefremov spake thusly:
> On Tue, Dec 15, 2015 at 10:04 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > Thomas, Yegor, Clayton, All,
> >
> > On 2015-12-14 14:03 +0100, Thomas Petazzoni spake thusly:
> >> Yegor, Clayton,
> >>
> >> On Mon, 14 Dec 2015 12:57:05 +0100, yegorslists at googlemail.com wrote:
> >> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >> >
> >> > Patch renames variable 'as' to 'pas' to avoid reserved keyword usage.
> >> >
> >> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > [--SNIP--]
> >> But the answer at
> >> https://mail.python.org/pipermail/xml-sig/2015-June/012272.html was
> >> pretty clear:
> >>
> >>    PyXML is bitrotten and obsolete. You'll find the functionality it
> >>    previously provided is now included in the Python standard library;
> > [--SNIP--]
> >> Can we get rid of it from Buildroot ?
> >
> > Unless Clayton (the original submitter) or Yegor (the reporter of the
> > breakage) actually use it, It'd be of the opinion to get rid of it.
> 
> I'm also for removing this package.

Care to send a path removing it, then, please? ;-)

> One positive thing about this
> package is, that Samuel could find a way to track down Python compile
> errors in the future.

Muhahaha! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
