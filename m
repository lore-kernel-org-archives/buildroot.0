From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 23:24:30 +0200
Subject: [Buildroot] [PATCH v2 1/1] zeromq: check if -latomic is needed
In-Reply-To: <20180507202623.29498-1-asafka7@gmail.com>
References: <20180507202623.29498-1-asafka7@gmail.com>
Message-ID: <20180507232430.7d507c55@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 May 2018 23:26:23 +0300, Asaf Kahlon wrote:
> Fixes:
> http://autobuild.buildroot.net/results/b149aa2ee00e4d6a53c884cf99ecb2dd8af58b65/
> http://autobuild.buildroot.net/results/e4b3616ac2695d3b6898185a70da6509b1faa2b8/
> 
> Patch the package to check if -latomic is needed to be added, depending on the
> result of AC_LINK_IFELSE.

Thanks for this new iteration.

> The patch was sent to upstream, see:
> https://github.com/zeromq/libzmq/pull/3083

Sadly, this pull request corresponds to the previous iteration, and it
has been merged. Perhaps you can send a follow-up patch upstream to
improve the situation ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
