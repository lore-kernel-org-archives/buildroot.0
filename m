From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Oct 2015 20:33:55 +0200
Subject: [Buildroot] [git commit] tstools: GitHub migration
In-Reply-To: <87fv15l8a8.fsf@dell.be.48ers.dk>
References: <20151020143645.F3EB4818D4@busybox.osuosl.org>
 <20151020171446.5db7b297@free-electrons.com>
 <56265B25.8070900@imgtec.com> <20151020163517.GB3738@free.fr>
 <87fv15l8a8.fsf@dell.be.48ers.dk>
Message-ID: <20151020183355.GC3738@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-10-20 20:11 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Note: I hate TABs. TABs are so 70s. Besides, since, as you said, the
>  > width of TABs varies very wildely between machines (due to personal
>  > tastes), it means that TABs can not reliably be used to provide a
>  > "beautiful" layout that is reprpducible everywhere as-is; various
>  > editors will always break that nice layout.
> 
>  > Besides, using 8-char-wide TABs means indentation very quickly limits
>  > the amount of space to write code (80-char-wide lines are close to the
>  > optimum width for human reading).
> 
>  > Also, it is very hard to configure one's editor, sicne coding rules vary
>  > between projects, some requiring leading TABs, 4- or 8- (or even 2!)
>  > char wide, while others require leading spaces...
> 
>  > There is today *no* reason to use leading TABs; any sane editor will
>  > happily insert how-many space you want when pressing TAB (heck, I guess
>  > even emacs is capable of that ;-] ).
> 
> While this is all true, Buildroot is mainly Kconfig and Makefiles, and
> both of those languages have special handling of tabs,

Makefile do require TABs (with GNU make that is changeable, btw, but it
gets very confusing very quickly... :-] ).
    https://www.gnu.org/software/make/manual/make.html#index-_002eRECIPEPREFIX-_0028change-the-recipe-prefix-character_0029

However, Kconfig has absolutely no requirement that TABs be used. The
only requirements are that config 'options' (bool, help, depends...) be
indented further than the 'config' keyword, and that the help text be
indented further than the 'help' keyword. And such indentation can very
well be spaces. Or TABs. Or both (but consistently, of course).

> so we have to stick to it.

Whether they have those requirements or not, we have to stick to our
coding rules. I never said otherwise. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
