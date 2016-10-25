From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Oct 2016 17:38:23 +0200
Subject: [Buildroot] [PATCH 00/30] Splitting the toolchain-external
 package
In-Reply-To: <e1154660-3e25-d1fc-1279-738e7d5c110e@mind.be>
References: <1477255711-28603-1-git-send-email-romain.naour@gmail.com>
 <f0262d9f-d9e0-9690-7a51-a094dd57c06b@mind.be>
 <20161025165404.2c91f30b@free-electrons.com>
 <e1154660-3e25-d1fc-1279-738e7d5c110e@mind.be>
Message-ID: <20161025173823.4e6794b5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 17:11:05 +0200, Arnout Vandecappelle wrote:

> > I'm personally fine with your proposal, we can keep everything in
> > pkg-toolchain-external.mk, both the infrastructure itself and all its
> > helper functions.  
> 
>  OK! So, do you prefer Romain to respin, or will you just apply and we fix later?

Romain, could you respin with:

 - Fixing the commit titles/logs for the first four patches

 - Regroup the utility functions in pkg-toolchain-external.mk, as
   Arnout suggests

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
