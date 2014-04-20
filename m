From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 11:09:24 +0200
Subject: [Buildroot] [PATCH 1/1] uboot: build custom target if custom
 target selected
In-Reply-To: <1392676369-19238-1-git-send-email-laurent.cans@gmail.com>
References: <1392676369-19238-1-git-send-email-laurent.cans@gmail.com>
Message-ID: <20140420110924.4545a967@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Laurent Cans,

On Mon, 17 Feb 2014 23:32:49 +0100, Laurent Cans wrote:
> When selecting custom uboot target the installation fail due to incorrect
> target built. So when configuring custom uboot target, build the target
> configured in buildroot configuration instead of legacy one.
> 
> Signed-off-by: Laurent Cans <laurent.cans@gmail.com>
> ---
>  boot/uboot/uboot.mk |    1 +
>  1 file changed, 1 insertion(+)

Two months ago you submitted this patch, and on the day of its
submission, Arnout made some comments on it. However, you never came
back with an updated version of the patch, and nobody else has stepped
up to fix the problem.

Could you resend an updated version that takes into account Arnout's
comment?

In the mean time, I'll mark your patch as "Changes requested" in our
patchwork. This means we will no longer see it in the list of pending
patches, so if you don't come back to us with an updated version, this
change will never be applied.

Thanks a lot for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
