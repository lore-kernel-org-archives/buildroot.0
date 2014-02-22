From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Feb 2014 19:23:34 +0100
Subject: [Buildroot] [PATCH 0 of 4] alsa-lib/alsa-utils autobuild fixes
In-Reply-To: <patchbomb.1392224140@argentina>
References: <patchbomb.1392224140@argentina>
Message-ID: <20140222192334.2d6bddd0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 12 Feb 2014 17:55:40 +0100, Thomas De Schampheleire wrote:

> This series fixes the alsa-lib / alsa-utils autobuild failures, most notably
> seen on Blackfin FLAT, but the alsa-utils problem was also seen on ARM.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Would you mind resending your series by taking into account Peter's
comment for PATCH 2, and then replace your PATCH 4 by a patch that
simply disallow alsa-utils on !MMU systems?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
