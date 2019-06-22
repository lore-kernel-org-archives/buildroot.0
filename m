From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 10:06:15 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/iputils: Reenable traceroute6
In-Reply-To: <20190619213008.7883-1-petr.vorel@gmail.com>
References: <20190619213008.7883-1-petr.vorel@gmail.com>
Message-ID: <20190622100615.2f4502d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 19 Jun 2019 23:30:06 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> Bump to s20190515 removed traceroute6 build (it's not built by default
> since this version in upstream). Reenable it again.
> 
> Fixes: 9ffcd9279e ("package/iputils: bump to version s20190515")
> 
> This requires fix similar to one in 0003-meson.build-fix-build-with-NLS.patch [1]
> 
> traceroute6 is in /usr/sbin, so no need to handle busybox problem
> (6e18892733 "package/iputils: move binaries to the location also used by
> Busybox").
> 
> [1] http://autobuild.buildroot.org/results/0a8a3efe734ac7fb3a68ba505277681857dc0a3d
> 
> Suggested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * Fix traceroute6 path in IPUTILS_PERMISSIONS, it must be /usr/bin/traceroute6

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
