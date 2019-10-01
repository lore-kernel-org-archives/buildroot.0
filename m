From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Oct 2019 08:58:32 +0200
Subject: [Buildroot] [PATCH v2 1/1] cmake: bump version to 3.15.3
In-Reply-To: <CADvTj4qO6FZYmjgP2GBLcrf7P-k14JCz2jVvcTrFT4B1Tt5dbQ@mail.gmail.com>
References: <20190929115731.128904-1-james.hilliard1@gmail.com>
 <20190930233542.6a084b17@windsurf.home>
 <CADvTj4qO6FZYmjgP2GBLcrf7P-k14JCz2jVvcTrFT4B1Tt5dbQ@mail.gmail.com>
Message-ID: <20191001085832.6d748766@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 1 Oct 2019 00:38:47 +0200
James Hilliard <james.hilliard1@gmail.com> wrote:

> > What is the reasoning for changing the minimal CMake version to 3.10 ?
> >  
> It's the minimum required by wpewebkit.

OK, but it's totally unrelated to the bump of CMake.

> > This minimum version is the minimum version required by all
> > cmake-package packages in Buildroot, and is important when the
> > system-provided cmake is used as opposed to using Buildroot's
> > host-cmake. So I don't see how it can be related to a version bump of
> > CMake.
> >
> > The second question is how many cmake-package packages you have tested
> > with this patch applied ? We don't need all of them to be tested, but
> > it would be good to test a fair amount of them, and provide in the
> > commit log the defconfig that was used to test all those packages.
>
> Not entirely sure but was probably a decent amount as part of my normal
> firmware builds.

Would be good to give a sense of how many packages where tested. It's
just that from our experience, bumping the packages implementing a
build system (cmake, meson, etc.) tend to break quite a bit of stuff,
and a 3.8 -> 3.15 bump is quite significant for cmake.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
