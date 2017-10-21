From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 22:16:53 +0200
Subject: [Buildroot] [PATCH] mpd: enable package for external ARC
 toolchain
In-Reply-To: <20171011121617.15179-1-didin@synopsys.com>
References: <20171011121617.15179-1-didin@synopsys.com>
Message-ID: <20171021221653.64e595e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 11 Oct 2017 15:16:17 +0300, Evgeniy Didin wrote:
> Now using prebuilt arc-2017.09-rc1 toolchain it is possible to
> build mpd package. The GCC patch solving the problem with pthread
> support check now is the part of ARC toolchain.
> 
> Note this patch has a prerequisite that updates ARC prebuilt toolchain,
> http://patchwork.ozlabs.org/patch/824311/
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> CC: Alexey Brodkin <abrodkin@synopsys.com>
> CC: arc-buildroot at synopsys.com
> CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
>  package/mpd/Config.in | 3 ---
>  1 file changed, 3 deletions(-)

As was pointed out in the comments, this is only applicable once the
ARC external toolchain has been updated. So could you please send both
patches as a patch series, once the final version of the 2017.09 ARC
external toolchain is available?

In the mean time I'll mark the patch as Changes Requested in patchwork.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
