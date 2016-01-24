From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2016 22:08:06 +0100
Subject: [Buildroot] [PATCH v3 2/2] docs/manual: patches that change
 files with spaces in the name
In-Reply-To: <56a5389a95e45_611f13d281c87bf@ultri2.mail>
References: <20160124162002.GE3405@free.fr>
 <56a5389a95e45_611f13d281c87bf@ultri2.mail>
Message-ID: <20160124210806.GG3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2016-01-24 18:48 -0200, Ricardo Martincoski spake thusly:
> Arnout, Yann E. MORIN,
> 
> On Sun, Jan 24, 2016 at 02:20 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> [snip]
> >>  - Arnout suggested to drop the patch to the manual:
> >>    "I think that this situation is so exotic that it doesn't warrant a
> >>    mention in the manual. The manual is already long and complicated
> >>    enough."
> >>    I updated the manual for now because it is a separate patch that can
> >>    be Rejected if others agree with Arnout.
> > 
> > Well, like Arnout said, the number of cases that this would bite us is
> > very limited (as in: there is only one case).
> > 
> > The most problematic issue here is not doing the fix, but recognising
> > the symptoms. This is such a rare occurence that I'm afraid we'll again
> > scratch our heads when we next encounter this issue. That is, if there's
> > ever a "next time"...
> > 
> > So I don't think it is necessary that the manual has a blurb about that.
> [snip]
> 
> Thank you both for your time.
> I will set this patch as Rejected.
> 
> All,
> 
> I guess I don't need to send a v4 for the series (now it became a
> single patch) while no change is requested in
> http://patchwork.ozlabs.org/patch/572263/
> If someone disagrees, just let me know and I will send it.

Indeed, no need to resubmit.

Thanmks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
