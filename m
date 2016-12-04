From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Dec 2016 14:05:56 +0100
Subject: [Buildroot] [PATCH] build/advanced: add option to check for use
	of cdefs.h
In-Reply-To: <20161204135202.109c6480@free-electrons.com>
References: <1480849177-16847-1-git-send-email-yann.morin.1998@free.fr>
 <20161204135202.109c6480@free-electrons.com>
Message-ID: <20161204130556.GA3433@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-12-04 13:52 +0100, Thomas Petazzoni spake thusly:
> On Sun,  4 Dec 2016 11:59:37 +0100, Yann E. MORIN wrote:
> > We want to catch programs that directly include sys/cdefs.h so that
> > we can fix them not to. So, we want to instrument sys/cdefs.h to emit
> > a warning when it is included.
> 
> Thanks for working on this. However, I am still not convinced that we
> want to merge such an additional complexity (one new Config.in choice
> with three sub-options, two additional Config.in options), a cdefs.h
> wrapper for glibc/uclibc, etc.
> 
> Do we really care about upstream packages using sys/cdefs.h? Is it
> really the most important battle to fight against upstream projects
> using sys/cdefs.h?

I don't really care. I did some cleanups and changes according to
comments to the previous, initial iteration, and just sent it to the
list for a final review before I delete it locally.

So, at least, it is in the list archives for posterity, in case we
want/need to revisit this later on.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
