From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Jul 2016 14:15:04 +0200
Subject: [Buildroot] [PATCH v2] toolchain: Bump ARC tools to
	arc-2016.09-eng006
In-Reply-To: <1468409466.29064.24.camel@synopsys.com>
References: <1468313301-30311-1-git-send-email-vzakhar@synopsys.com>
 <87r3ay5xhe.fsf@dell.be.48ers.dk>
 <1468409466.29064.24.camel@synopsys.com>
Message-ID: <20160713141504.170f4d3e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Jul 2016 11:31:06 +0000, Vlad Zakharov wrote:

> Could you please rebuild toolchain for ARC with this patch to keep us
> up to date with issues we have fixed and still have to fix?

Yes, I'll do it once the Git server is back online.

Note that we have two toolchain configuration for ARC in the
autobuilders:

http://autobuild.buildroot.net/toolchains/configs/br-arc-full-internal.config

This one is an internal toolchain configuration, so it always rebuilds
from scratch a toolchain, using the latest updates. So if there are
failures with this base configuration, they apply to your latest ARC
tools updates.

http://autobuild.buildroot.net/toolchains/configs/br-arcle-hs38.config

This one is a pre-built external toolchain, and indeed I have to
rebuild that one each time you update the ARC tools.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
