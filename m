From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Nov 2018 09:13:33 +0100
Subject: [Buildroot] [PATCH] stress-ng: really remove patch merged
 upstream
In-Reply-To: <20181125015936.25145-1-casantos@datacom.com.br>
References: <20181125015936.25145-1-casantos@datacom.com.br>
Message-ID: <20181125091333.0e6985c7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 23:59:36 -0200, Carlos Santos wrote:
> Should have been removed in commit 27bce5fc8e (package/stress-ng: bump
> to version 0.09.39) but was left as an empty file.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
> This should be applied on master to remove the empty patch before
> releasing Buildroot 2018.11.
> ---
>  .../0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch     | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  delete mode 100644 package/stress-ng/0001-stress-netlink-proc-fix-build-with-kernel-v3.9.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
