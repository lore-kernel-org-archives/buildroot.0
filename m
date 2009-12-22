From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Tue, 22 Dec 2009 21:47:51 +0100
Subject: [Buildroot] BR + CT-NG integration
In-Reply-To: <87r5qmwxx7.fsf@macbook.be.48ers.dk>
References: <200912212351.11487.yann.morin.1998@anciens.enib.fr>
	<4B30BC14.3050207@zacarias.com.ar>
	<87r5qmwxx7.fsf@macbook.be.48ers.dk>
Message-ID: <200912222147.51137.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Gustavo,
All,

On Tuesday 22 December 2009 21:34:12 Peter Korsgaard wrote:
>  Gustavo> The CRIS architecture is somewhat going to vanish since Axis
>  Gustavo> won't be selling/supporting the chips publically any
>  Gustavo> longer. Peter might want to drop it soonish.
> We had cris patches submitted earlier this year, so I don't plan on
> removing it right away.

I do agree. Ultimately, I'd like crostool-NG (and thus buildroot) to support
the same arch list as is currently available in uClibc (except maybe those
marked as 'broken') and the Linux kernel.

So I do not have any plan to _remove_ support for any arch, unless it proves
impractical to support (ie. it does not build, no one steps in with hardware,
and there's no qemu support).

Of course, support for said archs should be available for gcc and binutils
as well. I'm not too keen on bundling arch-support patches in crosstool-NG,
but avr32 is already in, so...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
`------------------------------^-------^------------------^--------------------'
