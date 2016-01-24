From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2016 14:57:00 +0100
Subject: [Buildroot] [git commit] package/cups: Un-deprecate,
 and update CUPS to 2.1.2
In-Reply-To: <CALdGskJ2qCvYG7zGBjesroKzofo=n-c1xCHHn+D2HroxzsZb6g@mail.gmail.com>
References: <20160121223830.DD957803E9@busybox.osuosl.org>
 <20160123162456.GB3363@free.fr> <20160123170613.GC3363@free.fr>
 <CALdGskJ2qCvYG7zGBjesroKzofo=n-c1xCHHn+D2HroxzsZb6g@mail.gmail.com>
Message-ID: <20160124135700.GB3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Olivier, All,

On 2016-01-24 08:23 +0200, Olivier Schonken spake thusly:
> That's a tough one.  I don't see an easy way to break the dependency
> without building one of the dependant packages twice.
> 
> To me it seems like we would have to decide on which functionality is least
> important at this stage.  Disabling Avahi LibGTK support when building Cups
> with Avahi and LibGTK, or disabling Cups Avahi support when building Cups
> with Avahi and LibGTK, or disabling LibGTK Cups support. (Unfortunately
> those are the easy fixes that lose some functionality)

I've settled on cutting the libgtk{2,3} -> cups dependency, which I'll
send soonish.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
