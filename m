From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Sep 2017 19:20:57 +0200
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to
 arc-2017.09-eng008
In-Reply-To: <20170914163702.2316-1-abrodkin@synopsys.com>
References: <20170914163702.2316-1-abrodkin@synopsys.com>
Message-ID: <20170914192057.701cd74c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this update. One question below though.

On Thu, 14 Sep 2017 19:37:02 +0300, Alexey Brodkin wrote:

> Now speaking about arc-2017.09 series it is built on top
> of upstream GCC 7.1.1 and Binutils 2.29 so please expect
> all kinds of breakages related to GCC 7.x as we saw earlier
> with move from 4.8 to 6.x :)

If those new versions are now based on upstream gcc 7.x and binutils
2.29, why do we still use the Synopsys specific versions? Do you still
have a large stack of patches on top of the upstream versions?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
