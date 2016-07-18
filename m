From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:31:33 +0200
Subject: [Buildroot] [PATCH] package/acpitool: not available for bfin
In-Reply-To: <20160718212005.GD12720@free.fr>
References: <1468778160-32413-1-git-send-email-yann.morin.1998@free.fr>
 <CAK4VdL1HipqOpg5CuYi+KDZiyrLBZQvNLYcDsECLHNC+pqsAiA@mail.gmail.com>
 <20160718183059.GA12720@free.fr>
 <20160718215151.4948f20d@free-electrons.com>
 <20160718212005.GD12720@free.fr>
Message-ID: <20160718233133.3dd7d144@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 23:20:05 +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-07-18 21:51 +0200, Thomas Petazzoni spake thusly:
> > On Mon, 18 Jul 2016 20:30:59 +0200, Yann E. MORIN wrote:  
> > > And on ARC:
> > >     http://autobuild.buildroot.org/results/203/203eb72ead23ea7930dc1a55dd54a8b3eea5c576/
> > >     http://autobuild.buildroot.org/results/5d5/5d5fd738f10697985adbc6ed58e6c52ee95b8b33/  
> > Is it reproducible on ARC ?  
> 
> No. It configures and builds fine with current master.

So presumably, it was a toolchain issue.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
