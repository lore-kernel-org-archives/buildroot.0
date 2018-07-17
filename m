From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Jul 2018 10:06:11 +0200
Subject: [Buildroot] [PATCH v2 6/6] support/testing/tests/core: SSP &
 hardening flags
In-Reply-To: <20180717030420.12009-1-matthew.weber@rockwellcollins.com>
References: <20180717030420.12009-1-matthew.weber@rockwellcollins.com>
Message-ID: <20180717100611.1d443355@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Jul 2018 22:04:20 -0500, Matt Weber wrote:
> Catch the commonly used options of SSP, Relro, and fortify.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

I'm a bit confused by this patch coming alone, outside of any series.
Is it just because you had only changes to this PATCH 6/6 that you
didn't resent the full series ?

In general, my preference is that a full series gets resent, because it
is obvious what your intention is. By just resending one patch, I
wonder if you really sent that one patch, or if all patches were sent,
but the previous ones were lost/not received for some reason.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
