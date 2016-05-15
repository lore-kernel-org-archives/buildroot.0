From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:55:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-05-13
In-Reply-To: <20160514160242.GB3877@free.fr>
References: <20160514063024.2C7B91025E9@stock.ovh.net>
 <20160514154655.57ae0bad@free-electrons.com>
 <20160514145905.GA3877@free.fr> <20160514160242.GB3877@free.fr>
Message-ID: <20160515215531.7824d583@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 May 2016 18:02:42 +0200, Yann E. MORIN wrote:

> I've just run this config on my autobuilder, and the build was fine
> (twice in a row, once with the machine already loaded, once with the
> machine otherwise idle).
> 
> I'll do a few such builds in loop, just to see if the issue is
> reproducible.

I think the issue is hard to reproduce: according to
http://autobuild.buildroot.net/?reason=host-python3-3.4.3, it occurred
only 15 times over the last 6 months, while I believe the host-python3
package has been built hundreds to thousands of times.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
