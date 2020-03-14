From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:19:08 +0100
Subject: [Buildroot] [PATCH v2] package/util-linux: fix build for
 riscv64 and powerpc64le
In-Reply-To: <20200313010611.17176-1-unixmania@gmail.com>
References: <20200313010611.17176-1-unixmania@gmail.com>
Message-ID: <20200314151908.216d48b5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Mar 2020 22:06:11 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Pull two upstream patches that fix the declaration of pidfd_open and
> pidfd_send_signal.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/2396b04478f9d358b94f2e2e05540625ddc9f205/
>   http://autobuild.buildroot.net/results/ed4b5ec61bd33d3ccf0ebb16000af46d0499366d/
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
> Chanves v1->v2: add SOB to patches
> ---
>  ...-types.h-before-checking-SYS_pidfd_s.patch | 62 +++++++++++++++++++
>  .../0007-include-cleanup-pidfd-inckudes.patch | 40 ++++++++++++
>  2 files changed, 102 insertions(+)
>  create mode 100644 package/util-linux/0006-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
>  create mode 100644 package/util-linux/0007-include-cleanup-pidfd-inckudes.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
