From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Aug 2015 10:18:06 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-08-10
In-Reply-To: <20150812043418.GJ8475@waldemar-brodkorb.de>
References: <20150811063012.4DDBD1012EE@stock.ovh.net>
 <20150812043418.GJ8475@waldemar-brodkorb.de>
Message-ID: <20150812101806.72f55a1a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 12 Aug 2015 06:34:18 +0200, Waldemar Brodkorb wrote:

> >          sh4 |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/f373f0b20cf127b3e54970ed50d45fc5c38991a7/
> 
> There is a patch for gcc in the bugtracker for this.
> Should we add it to gcc 4.9.3?

If you look at the GCC PR for this bug, I restarted the discussion a
few days ago. My worry is that the patch proposed in the bug tracker
has not been merged in any gcc branch for now, as far as I know. So it
has never been tested by the gcc regression tests and so on.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
