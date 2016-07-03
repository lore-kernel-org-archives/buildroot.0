From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 21:29:47 +0200
Subject: [Buildroot] [PATCH v3 1/1] babeld: new package
In-Reply-To: <1465355790-16139-1-git-send-email-christian@paral.in>
References: <1465355790-16139-1-git-send-email-christian@paral.in>
Message-ID: <20160703212947.5aa91caf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Jun 2016 20:16:30 -0700, Christian Stewart wrote:
> Babel is a loop-avoiding distance-vector routing protocol for IPv6 and
> IPv4 with fast convergence properties. It is based on the ideas in DSDV,
> AODV and Cisco's EIGRP, but is designed to work well not only in wired
> networks but also in wireless mesh networks, and has been extended with
> support for overlay networks.
> 
> https://www.irif.univ-paris-diderot.fr/~jch/software/babel/
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Thanks for this new version, but I forgot about it, and Maxime
Hadjinlian separately sent the same package, with almost exactly the
same contents. I have merged Maxime's patch, sorry about that.

But the most important is that babeld is now in Buildroot :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
