From: Rob Landley <rob@landley.net>
Date: Mon, 7 Aug 2006 20:36:35 -0400
Subject: [Buildroot] selecting busybox releases
In-Reply-To: <19455.63.193.249.101.1154900344.squirrel@webmail.aerende.com>
References: <19455.63.193.249.101.1154900344.squirrel@webmail.aerende.com>
Message-ID: <200608072036.35524.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 06 August 2006 5:39 pm, jtesta at aerende.com wrote:
> Once I have a stable version of buildroot compiled,
> how do I guarantee that I always get the same version
> of the packages, say busybox for example?
> 
> I tried unselecting the "Use the daily snaphost of Busybox"
> but that started to download another version.

I recommend using the release version of busybox unless you either want to 
help us debug the thing or else need a specific new feature that wasn't in 
the latest release version.

Daily snapshots of busybox can have all sorts of random half-finished stuff in 
them, but we try to stabilize -devel into a new release every few months.  
1.2.0 came out June 30, and 1.2.1 (a bugfixes only dot-release) was only a 
week or two back.  So at this point, the busybox -devel tree has only 
accumulated a little over a month's worth of new changes, and we plan to have 
our next release including the new development (1.3.0) in December.


uClibc may go a year between releases (technically it has 10 more days until 
this is the case), and buildroot itself may never have an actual stable 
release with a version number and everything, but the current BusyBox 
maintainer is kind of big into the whole concept. :)

> Thanks,
> 
> Jim

Rob
-- 
Never bet against the cheap plastic solution.
