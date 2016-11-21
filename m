From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Nov 2016 22:00:32 +0100
Subject: [Buildroot] [PATCH 4/4] qextserialport: fix static build
In-Reply-To: <9e55426c-e90e-6b11-752c-adba35813e23@mind.be>
References: <20161120221329.5827-1-arnout@mind.be>
 <20161120221329.5827-4-arnout@mind.be>
 <20161121214125.2bb92b98@free-electrons.com>
 <9e55426c-e90e-6b11-752c-adba35813e23@mind.be>
Message-ID: <20161121220032.18cf159d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Nov 2016 21:53:51 +0100, Arnout Vandecappelle wrote:

> > It's a bit annoying that this comes late in the series. Some of the
> > rework in the previous patches are not technically needed to get this
> > build fix, and with the way your patch series is organized, we have to
> > merge more-or-less unrelated cleanups in master to get the build fix.  
> 
>  Well, I considered patches 1 and 2 to be safe enough to be used even for
> master. Just to give you the choice, I'll respin without patches 1 and 2 (but
> without marking this series as superseded).

Yeah, it's true 1 and 2 are quite obvious, and 3 is really needed for
the build fix. I guess I'll apply as-is, no need to respin.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
