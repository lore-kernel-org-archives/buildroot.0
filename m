From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 14:25:57 +0200
Subject: [Buildroot] [PATCH] package/xen: Use POSIX complaint header
 includes
In-Reply-To: <20170421172933.18487-1-alistair.francis@xilinx.com>
References: <20170421172933.18487-1-alistair.francis@xilinx.com>
Message-ID: <20170422142557.60c25d43@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 10:29:33 -0700, Alistair Francis wrote:
> To fix build issues when using the musl library use POSIX compatible
> library inclues.
> 
> This fixes this autobuilder issue:
> http://autobuild.buildroot.net/results/1aa/1aa1303f60372f51aa5a7eb18caac4a5b5c1d9d4/build-end.log
> 
> These two patches have been by accepted upstream Xen and will be in 4.9:
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=b4cd5173183fbc118e2dc2a0d2e0d5038daf4fb5
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=4703a9ba9bb0c9c2804813ffe0943177d5f96039
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> V2:
>  - Update commit message to include build fixes and upstream status
>  - Update patches to include upstream reviews

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
