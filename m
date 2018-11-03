From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Nov 2018 14:28:10 +0100
Subject: [Buildroot] [PATCH v1] libv4l: add missing bpf_common.h header
In-Reply-To: <20181102190108.29507-1-ps.report@gmx.net>
References: <20181102190108.29507-1-ps.report@gmx.net>
Message-ID: <20181103142810.7c8fe947@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  2 Nov 2018 20:01:08 +0100, Peter Seiderer wrote:
> Fixes [1] (for older toolchains not providing this header):
> 
>     CC       keytable.o
>   In file included from bpf.h:26:0,
>                    from keytable.c:37:
>   ../../include/linux/bpf.h:12:10: fatal error: linux/bpf_common.h: No such file or directory
>    #include <linux/bpf_common.h>
>             ^~~~~~~~~~~~~~~~~~~~
> 
> [1] http://autobuild.buildroot.org/results/d22c0939eed4bc949f7eaeae7595d01ec45cc2cd
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  .../0005-Add-missing-linux-bpf_common.h.patch | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 package/libv4l/0005-Add-missing-linux-bpf_common.h.patch

Applied to master, thanks. Could you submit this upstream? Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
