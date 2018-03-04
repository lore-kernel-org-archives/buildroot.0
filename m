From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Mar 2018 10:01:06 +0100
Subject: [Buildroot] [PATCH v4] systemd: switch to en_US.UTF-8 locale
 when building
In-Reply-To: <87vaecbsf2.fsf@paral.in>
References: <20180212213400.15061-1-julius@kriukas.lt>
 <20180222230055.25455-1-julius@kriukas.lt>
 <20180302224535.38c7ccd9@windsurf.home> <87vaecbsf2.fsf@paral.in>
Message-ID: <20180304090106.GA2389@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2018-03-03 19:22 -0500, Christian Stewart spake thusly:
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
> > I've changed to use C.UTF-8 instead of en_US.UTF-8 and applied to
> > master. Thanks!
> 
> This has broken the build on Gentoo, unfortunately.

Grr.. Gentoo... Grr...

The major distros (Debian and derivatives, Fedora...) all have C.UTF-8.
Gentoo is again playing solo... Sigh... :-/

I'm onto a fix for that, now...

> Is it possible to compile with an en_US.UTF-8 or other language-specific
> UTF-8 locale, such that the build again works on Gentoo?

Not everyone on Earth is American, by far, so we already ruled out using
a hard-coded en_US.UTF-8 locale; for example, I don't have it on my
system (although I do have, and do use, an english locale, en_GB.UTF-8).

I'm onto a fix now...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
