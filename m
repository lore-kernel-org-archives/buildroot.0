From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:45:49 +0100
Subject: [Buildroot] [PATCH] gcc: fix incorrect handling of the
	comparison arguments
In-Reply-To: <1448558498-8518-1-git-send-email-ltrimas@synopsys.com> (Lada
 Trimasova's message of "Thu, 26 Nov 2015 20:21:38 +0300")
References: <1448558498-8518-1-git-send-email-ltrimas@synopsys.com>
Message-ID: <871tbctoxe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lada" == Lada Trimasova <Lada.Trimasova@synopsys.com> writes:

Hi,

 > This patch fixes compiler error during libbroadvoice build.
 > The comparison arguments where not correctly handled.
 > The fix is done in development tree:
 > https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/b4035128ba8f8bbbf9527f54f261a87b304ca4c5
 > and will be a part of the next release of ARC GNU tools.
 > Once that new release happens this patch must be removed.

 > Fixes:
 > http://autobuild.buildroot.net/results/bea/beace68a19382b43370c798dcf7d2ef412f9d75e/

 > Signed-off-by: Lada Trimasova <ltrimas@synopsys.com>
 > Cc: Alexey Brodkin <abrodkin@synopsys.com>
 > Cc: Anton Kolesov <akolesov@synopsys.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Alex/Anton, an acked-by would be good. Should this go into the 2015.11
release?

-- 
Venlig hilsen,
Peter Korsgaard 
