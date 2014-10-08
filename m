From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Oct 2014 18:18:11 +0200
Subject: [Buildroot] Review of FOSDEM 2014 meeting action points
In-Reply-To: <CAHXCMMLaWJki-F0NXKAw243DWUKdtWeE=q1iDNoVdi+2_z9s7w@mail.gmail.com>
References: <20141008104845.495ad683@free-electrons.com>
 <CAHXCMMLaWJki-F0NXKAw243DWUKdtWeE=q1iDNoVdi+2_z9s7w@mail.gmail.com>
Message-ID: <20141008181811.22ce7d64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Wed, 8 Oct 2014 10:54:04 +0200, Samuel Martin wrote:

> >  - Autouilder wishlist:
> >
> >    - Run-time tests. Nothing has been done, since we had no GSoC to
> >      make progress on this.
> >
> >    - Expand the number of autobuild machines: done, thanks to the
> >      autobuild-run script. Nathaniel Roach and Richard Braun are
> >      participating to the testing effort, and Peter has added more
> >      machines. We now have ~200-230 builds per day, up from ~100
> >      builds per day.
> >
> >    - Click on a package and see the last failures of that package:
> >      this has been implemented.
> >
> >    - Expose read-only SQL queries: not done, maybe a bit difficult
> >      security wise.
> 
> - Having the package patch/configure/build/install phases in the
> build.log file (not just the N line of the build).

Indeed. Patches welcome :-)

>   You could even image having the config.log or CMakeCache.txt file
> uploaded as well to help investigation.

There is already a patch implementing this, from Romain Naour, see
"[PATCH 1/1] autobuild-run: Include the config.log file (when it
exists) in the tarball" on the list. I haven't reviewed it yet, but on
principle, it looks like something useful to do.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
