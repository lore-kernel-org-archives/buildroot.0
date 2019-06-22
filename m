From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 19:28:51 +0200
Subject: [Buildroot] [PATCH] support/testing/infra/emulator: increase
 memory size used by Qemu
In-Reply-To: <20190621202724.19242-1-thomas.petazzoni@bootlin.com>
References: <20190621202724.19242-1-thomas.petazzoni@bootlin.com>
Message-ID: <20190622192851.58f18e0f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 21 Jun 2019 22:27:24 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> By default, Qemu emulates a system with 128 MB of RAM. This is not
> sufficient for some test cases we have, such as TestPerlDBDmysql,
> where the initramfs is quite large. Therefore, this commit extends the
> RAM size emulated by Qemu to 256 MB.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/237108668
> 
> Thanks to Arnout for the analysis of the issue.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/testing/infra/emulator.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
