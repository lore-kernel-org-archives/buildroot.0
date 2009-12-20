From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 20 Dec 2009 22:37:58 +0100
Subject: [Buildroot] External toolchain: crosstool-NG instead of
	buildroot?
In-Reply-To: <877hsh1l3i.fsf@macbook.be.48ers.dk>
References: <hgfudc$e2$1@ger.gmane.org> <877hsh1l3i.fsf@macbook.be.48ers.dk>
Message-ID: <200912202237.58730.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, and All!

On Sunday 20 December 2009 20:50:09 Peter Korsgaard wrote:
> we had some discussion about working
> closer together with the crosstool-NG people, E.G. long term perhaps
> getting rid of toolchain building in BR, and simply use crosstool-NG for
> it.

As you mentioned the subject, I think we should prepare both projects so
crosstool-NG offers all that buildroot needs, and maybe tweak a few things
in buildroot to efficiently use crostool-NG.

The plans for crosstool-NG are a ~4-month release cycle, as 3 months is
too short for me alone to handle. I think I can adapt the release cycle
to more closely follow buildroot. In fact, I think that, to be efficient,
crosstool-NG should be released one month ahead of buildroot, so that
potential bugs can be fixed and a bug-fix release can be made just before
the buildroot release. That way, buildroot can rely on an as-stable-as-
possible release. Next crosstool-NG release is due for late January, so
that should be a match for the next buildroot (planned February, I guess).

Apart form that, we could build upon the results of the BR developper day.
Should I repost my summary to this list?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
`------------------------------^-------^------------------^--------------------'
