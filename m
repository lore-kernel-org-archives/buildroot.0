From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:34:20 +0200
Subject: [Buildroot] [PATCH] Revert "zeromq: needs NPTL"
In-Reply-To: <20180505160530.GA1774@waldemar-brodkorb.de>
References: <20180505160530.GA1774@waldemar-brodkorb.de>
Message-ID: <20180508153420.0c334f27@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks Waldemar for fixing this issue. Some questions below, though.

On Sat, 5 May 2018 18:05:31 +0200, Waldemar Brodkorb wrote:
> This reverts commit 1e2a8d4111f57e79c1848c7a70c6501e2bdacd58.
> 
> Latest uClibc-ng release supports the missing functions even for

What is "Latest" ? 1.0.30 ?

In fact, it's not even in an uClibc-ng release I believe, it's fixed by
0002-librt-declare-clock_nanosleep-independent-of-thread-.patch, which
will be part of 1.0.31. Is this correct ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
