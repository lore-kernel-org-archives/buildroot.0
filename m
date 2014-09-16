From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Sep 2014 21:45:37 +0200
Subject: [Buildroot] [PATCH v2] ARC: gcc - Fix SIZE_TYPE to be "unsigned
 int" instead of "long unsigned int"
In-Reply-To: <1410792593-422-1-git-send-email-abrodkin@synopsys.com>
References: <1410792593-422-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140916214537.11e0da0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 15 Sep 2014 18:49:53 +0400, Alexey Brodkin wrote:
> This makes size_t to be "unsigned" ssize_t which makes happy compiler on data
> type checks.
> 
> Fix is taken from current development branch of GCC for ARC and will be a
> part of the next release of ARC tools, so at that point patch should be dropped.
> 
> https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/249f040299402647525c3f15b79d319fa7acddd3
> 
> Fixes http://autobuild.buildroot.net/results/405/405da9a945511329929b18740b983c51b8dcc43e
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

though you still forgot to add your SoB in the patch itself. I guess
Peter can add it when applying.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
