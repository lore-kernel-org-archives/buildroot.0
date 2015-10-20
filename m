From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 20:11:27 +0200
Subject: [Buildroot] [git commit] tstools: GitHub migration
In-Reply-To: <20151020163517.GB3738@free.fr> (Yann E. MORIN's message of "Tue, 
 20 Oct 2015 18:35:17 +0200")
References: <20151020143645.F3EB4818D4@busybox.osuosl.org>
 <20151020171446.5db7b297@free-electrons.com>
 <56265B25.8070900@imgtec.com> <20151020163517.GB3738@free.fr>
Message-ID: <87fv15l8a8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Note: I hate TABs. TABs are so 70s. Besides, since, as you said, the
 > width of TABs varies very wildely between machines (due to personal
 > tastes), it means that TABs can not reliably be used to provide a
 > "beautiful" layout that is reprpducible everywhere as-is; various
 > editors will always break that nice layout.

 > Besides, using 8-char-wide TABs means indentation very quickly limits
 > the amount of space to write code (80-char-wide lines are close to the
 > optimum width for human reading).

 > Also, it is very hard to configure one's editor, sicne coding rules vary
 > between projects, some requiring leading TABs, 4- or 8- (or even 2!)
 > char wide, while others require leading spaces...

 > There is today *no* reason to use leading TABs; any sane editor will
 > happily insert how-many space you want when pressing TAB (heck, I guess
 > even emacs is capable of that ;-] ).

While this is all true, Buildroot is mainly Kconfig and Makefiles, and
both of those languages have special handling of tabs, so we have to
stick to it.

-- 
Venlig hilsen,
Peter Korsgaard 
