From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 May 2014 08:43:11 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-22
In-Reply-To: <20140528063024.GA3510@free.fr>
References: <20140523063008.8A64410106F@stock.ovh.net>
 <CAHkwnC-hvNQMqCJ3iqL=EVEb8FvGNA9+ZU56OngtCe=1pAmf5w@mail.gmail.com>
 <20140523190819.45a80027@free-electrons.com>
 <53857DE2.6040509@mind.be> <20140528063024.GA3510@free.fr>
Message-ID: <20140528084311.05629fce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 28 May 2014 08:30:24 +0200, Yann E. MORIN wrote:

> >  A proper solution would be to adapt our libtool patches to interpret -static as
> > -all-static. Or alternatively, to patch the compiler wrapper to interpret
> > -all-static as -static (and then of course we'd have to generalize the compiler
> > wrapper to also use it for internal toolchains).
> 
> Yes, I think this is a good idea. But we can't use the wrapper to build
> the toolchain itself, of course.

And there is no wrapper at all when we use the internal toolchain
backend. At least as of today.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
