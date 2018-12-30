From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 17:00:28 +0100
Subject: [Buildroot] [PATCH] package/acpica: add missing dependencies
 for host variant
In-Reply-To: <20181228135502.24798-1-thomas.petazzoni@bootlin.com>
References: <20181228135502.24798-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181230170028.34be03a4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Dec 2018 14:55:02 +0100, Thomas Petazzoni wrote:
> Just like the target acpica package needs host-flex and host-bison,
> the host variant also needs the same dependencies. This allows to fix
> the build of "make host-acpica", which was detected thanks to
> per-package directory support.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/acpica/acpica.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
