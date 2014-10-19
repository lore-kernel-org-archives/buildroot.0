From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:56:49 +0200
Subject: [Buildroot] [PATCH 01/15] package/pkg-cmake.mk: globally
 disable doc, examples and tests
In-Reply-To: <CAHXCMMKCj2PoOrL0xGPRfp=FOhZm4=tN2RdPJR9J-J=_3ro_3w@mail.gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
 <1413741891-30113-2-git-send-email-s.martin49@gmail.com>
 <20141019221013.090eb47d@free-electrons.com>
 <CAHXCMMKCj2PoOrL0xGPRfp=FOhZm4=tN2RdPJR9J-J=_3ro_3w@mail.gmail.com>
Message-ID: <20141019225649.2f16bd37@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 19 Oct 2014 22:28:18 +0200, Samuel Martin wrote:

> > Are these options standardized by CMake, or are they just "generally"
> > used by a number of packages?
> 
> Not standardized by CMake, just used by a number of packages.
> 
> >
> > If not, I don't see why they should be passed by the
> > CMake infrastructure.
> 
> Since we don't really care about these things, and don't want to be
> bothered by failure because of these features, I think it's a way to
> enforce disabling them.

And so, we will keep adding more and more options that are not CMake
standard options to the core CMake infrastructure?

I know we've done that for pkg-autotools, but I'm not sure it was such
a great idea. Especially, I'd like to understand where we will stop:
will we, when two packages have common options, move them to the common
infrastructure, even if those options are not CMake standard at all?

At least, I'd like to see what is our "policy" about this, and get some
feedback from other Buildroot developers on this.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
