From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 08:47:06 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-22
In-Reply-To: <20140528084311.05629fce@free-electrons.com>
References: <20140523063008.8A64410106F@stock.ovh.net>
 <CAHkwnC-hvNQMqCJ3iqL=EVEb8FvGNA9+ZU56OngtCe=1pAmf5w@mail.gmail.com>
 <20140523190819.45a80027@free-electrons.com>
 <53857DE2.6040509@mind.be> <20140528063024.GA3510@free.fr>
 <20140528084311.05629fce@free-electrons.com>
Message-ID: <20140528064706.GC3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-28 08:43 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Wed, 28 May 2014 08:30:24 +0200, Yann E. MORIN wrote:
> 
> > >  A proper solution would be to adapt our libtool patches to interpret -static as
> > > -all-static. Or alternatively, to patch the compiler wrapper to interpret
> > > -all-static as -static (and then of course we'd have to generalize the compiler
> > > wrapper to also use it for internal toolchains).
> > 
> > Yes, I think this is a good idea. But we can't use the wrapper to build
> > the toolchain itself, of course.
> 
> And there is no wrapper at all when we use the internal toolchain
> backend. At least as of today.

Hu? Of course we're not using the wrapper for internal toolchain. That's
why I replied it would be a good idea to use it (OK, I should have
trimmed the quote a bit more.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
