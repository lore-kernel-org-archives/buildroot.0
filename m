From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 12:09:51 +0100
Subject: [Buildroot] [PATCH] Add back rootfs-* dependencies to "source"
 and "legal-info" targets
In-Reply-To: <1394726819-13062-1-git-send-email-fabio.porcedda@gmail.com>
References: <1394726819-13062-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140329120951.249fb055@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Thu, 13 Mar 2014 17:06:59 +0100, Fabio Porcedda wrote:
> After adding support top-level parallel make the rootfs-* dependencies
> were not anymore considered for the "source" and "legal-info" targets
> because the rootfs-* targets were removed from TARGETS variable and
> placed in the TARGETS_ROOTFS variable so to fix the issue use use both
> "TARGETS" and "TARGETS_ROOTFS" variables.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Vincent Stehl? <vincent.stehle@freescale.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
