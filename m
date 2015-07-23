From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:11:33 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-22
In-Reply-To: <55B12984.2090104@openwide.fr>
References: <20150723063018.EA19A101D01@stock.ovh.net>
 <55B12984.2090104@openwide.fr>
Message-ID: <20150723221133.51e59215@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu, 23 Jul 2015 19:51:00 +0200, Romain Naour wrote:
> Hi Alexey,
> 
> Le 23/07/2015 08:30, Thomas Petazzoni a ?crit :
> > Detail of failures
> > ===================
> 
> >       xtensa |         host-gcc-initial-4.9.3 | NOK | http://autobuild.buildroot.net/results/56de85f9bc0ba44248003212b5dc4cb8dcde19c5/
> 
> I noticed a new build failure in autobuilders due to your gcc package patch:
> http://patchwork.ozlabs.org/patch/453849/

Did you notice xtensa or other platforms as well? Before applying
Alexey's patch I tested an ARM toolchain build with -O2 and -Os and it
built fine.

Though it's indeed a problem if it causes a regression on other
architectures. Alexey, Max, can you have a look at least for the Xtensa
case? If there is no feedback soon, I'll revert Alexey's patch in the
mean time.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
