From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Aug 2020 16:12:05 +0200
Subject: [Buildroot] [PATCH] package/apcupsd: add -lstdc++ for ARC7* and
 SPARC
In-Reply-To: <20200812140720.43524-1-Evgeniy.Didin@synopsys.com>
References: <20200812140720.43524-1-Evgeniy.Didin@synopsys.com>
Message-ID: <20200812161205.62542d08@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Aug 2020 17:07:20 +0300
Evgeniy Didin <Evgeniy.Didin@synopsys.com> wrote:

> For some reason apcupsd is not building for ARC700 and SPARC,
> adding "-lstdc++" solves the issue.
> 
> Fixes:
> http://autobuild.buildroot.org/results/3be/3bedf404de0ea42ee3ba624cded65d310a847af9//
> http://autobuild.buildroot.org/results/6ab/6ab4e8021aad13bc153a6c22e87a77bf2bdc21e0//
> 
> Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>

A similar patch was already submitted a while ago, and the same
question was already asked back then: "why ?".

The "some reason" is not really a satisfying justification.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
