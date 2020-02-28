From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Feb 2020 15:57:39 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-02-27
In-Reply-To: <20200228145500.GA39900@p1g2.work>
References: <5e58c07a.1c69fb81.188c8.fdd9SMTPIN_ADDED_MISSING@mx.google.com>
 <20200228145500.GA39900@p1g2.work>
Message-ID: <20200228155739.7f31a6c9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Feb 2020 15:55:00 +0100
Gary Bisson <bisson.gary@gmail.com> wrote:

> >     arch     |             reason             |                                       url                                      
> > -------------+--------------------------------+---------------------------------------------------------------------------------
> >     arm      |      host-mfgtools-v0.02       | http://autobuild.buildroot.net/results/33f8e4054f2b9b9b4f0ff21a7016b4fa44b58ff0  
> 
> Is it possible to cherry-pick this patch to the 2019.02.x branch?
> https://git.buildroot.net/buildroot/commit/package/mfgtools?id=8e267afcc2912c40a4317c7580c8f8f2fa202489
> 
> Or should I re-send it with 2019.02.x in the title?

This patch has fairly "recently" been committed to master, on Feb 16,
so I think Peter has not yet done his regular pass on all commits to
master, and see which ones are relevant to 2019.02.

When he does, I'm pretty sure he will cherry-pick this patch,
especially now that you explicitly notified us about it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
