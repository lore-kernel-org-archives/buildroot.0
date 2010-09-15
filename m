From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 15 Sep 2010 22:46:25 +0200
Subject: [Buildroot] external toolchain question
In-Reply-To: <4C911F74.7040506@googlemail.com>
References: <4C910D9F.2060308@carallon.com>
	<201009152050.27019.yann.morin.1998@anciens.enib.fr>
	<4C911F74.7040506@googlemail.com>
Message-ID: <201009152246.25893.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus, All,

On Wednesday 15 September 2010 21:33:08 Marcus Osdoba wrote:
> Sorry, I didn't want to dispraise your work. Crosstool-ng is amazing!

No problem, I did take no offense! :-)

> But I had a quick look into it and figured out:
> BR has 4.3.5 since June 2010 and 4.4.4 since May 2010.
> The crosstool-ng version 1.8.1 provides 4.3.4 and 4.4.3 as default. With 
> experimental activated no 4.3.5 either.

Well, I focus on adding the latest versions, and easily give up on legacy
stuff. The way forward is not 4.3, but 4.5. But, if you find 4.3.x is
still usefull to you, then you can submit support for that and it'll make
in! :-)

And since you speak of dates...  ;-)
- gcc-4.4.4 is in since May the 16th, 2010
- gcc-4.5.0 is in since April the 15th, 2010
- gcc-4.5.1 is in since August the 1st, 2010

> The eglibc points to 2.10 (2.11stable/2.12exp) and glibc to 2.9 
> (2.11.2stable/2.12exp).

Well, glibc is... Special, to say the least. I'm not using it very often,
so it lags behind...

> So my overall (subjective) impression was that br has currently a higher 
> patchlevel.

Not "patchlevel". I'd rather say "more and/or newer features". The fact
is, the default in crosstool-NG is gcc-4.4.3, and gcc-4.4.4 in buildroot.
That's not a big gap, and being closed shortly I hope. ;-)

But if you look closely, crosstool-NG has support for Linux, Mingw32, and
bare-metal. It has support for glibc, eglibc, uClibc, newlib. It is fairly
easy to add new alternatives to any component.

Toolchain-wise, buildroot has support for Linux and uClibc; that's inherent
to its history.
But it is also capable of building a whole lot of userland packages.

Not the same goal, not the same feature set. :-)

> By the way, I completely agree with Peters opinion that crosstool-ng 
> could provide "better" toolchains while br focusses on it's maintask.

Yes, this is the ultimate, loooong term goal.

> Crosstool-ng is designed to generate toolchains as a specialised tool - 
> really great. I saw that integration of ct-ng in br (or more intuitive 
> config wrapper) is quite a long time on the agenda. I think it would be 
> very eligible to see it in br.
> What is the current status of this idea?

That's a legitimate question. I'll post a summary on the list shortly.
Thanks for asking! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
