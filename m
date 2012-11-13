From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Nov 2012 09:51:40 +0100
Subject: [Buildroot] [PATCH for-2012.11 1/5] pkg-infra: introduce errors
 for legacy API
In-Reply-To: <50A167A6.5000705@mind.be>
References: <1352750912-16012-1-git-send-email-arnout@mind.be>
 <1352750912-16012-2-git-send-email-arnout@mind.be>
 <20121112220539.7e41409b@skate> <50A167A6.5000705@mind.be>
Message-ID: <20121113095140.034cf667@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 12 Nov 2012 22:18:30 +0100, Arnout Vandecappelle wrote:

> > BR2_LEGACY here maybe?
> 
>   No that would not make sense - we want to get the error message if BR2_LEGACY
> is selected (automatically, by Config.in.legacy).
> 
> The idea of the condition is to have an escape path, if you don't want to deal
> with all the stuff that is misconfigured (not only legacy config symbols but also
> host-pkg-config etc.), you can just build with BR2_DEPRECATED=y and see how far
> you get.

Aaah, ok.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
