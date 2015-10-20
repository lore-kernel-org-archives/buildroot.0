From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Oct 2015 18:35:17 +0200
Subject: [Buildroot] [git commit] tstools: GitHub migration
In-Reply-To: <56265B25.8070900@imgtec.com>
References: <20151020143645.F3EB4818D4@busybox.osuosl.org>
 <20151020171446.5db7b297@free-electrons.com>
 <56265B25.8070900@imgtec.com>
Message-ID: <20151020163517.GB3738@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2015-10-20 16:17 +0100, Vicente Olivert Riera spake thusly:
> On 10/20/2015 04:14 PM, Thomas Petazzoni wrote:
> > On Tue, 20 Oct 2015 16:33:07 +0200, Peter Korsgaard wrote:
> >> -	  This is a set of cross-platform command line tools for
> >> -	  working with MPEG data
> >> +	  This is a set of cross-platform command line tools for working with
> >> +	  MPEG data.
> > 
> > This clearly doesn't fit in 72 characters now, except if you count tab
> > as one character of course. emacs says that the long line here is now
> > 77 characters long.
> 
> Yes, I count the tab as 1 character. Shouldn't I?
> 
> For me, the tab is 1 character. Then you can set your text editor to
> display the tabs as you want. You can display them as 1 space, 2, 3, 4...

A TAB is one byte, but N characters. And in buildroot, we use N=8.

Note: I hate TABs. TABs are so 70s. Besides, since, as you said, the
width of TABs varies very wildely between machines (due to personal
tastes), it means that TABs can not reliably be used to provide a
"beautiful" layout that is reprpducible everywhere as-is; various
editors will always break that nice layout.

Besides, using 8-char-wide TABs means indentation very quickly limits
the amount of space to write code (80-char-wide lines are close to the
optimum width for human reading).

Also, it is very hard to configure one's editor, sicne coding rules vary
between projects, some requiring leading TABs, 4- or 8- (or even 2!)
char wide, while others require leading spaces...

There is today *no* reason to use leading TABs; any sane editor will
happily insert how-many space you want when pressing TAB (heck, I guess
even emacs is capable of that ;-] ).

But since Buildroot has decided to go with leading TABS, and 8-char-wide
TABs, I abide to that rule! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
