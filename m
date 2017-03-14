From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 23:39:57 +0100
Subject: [Buildroot] [PATCH 1/2] uboot: Config.in: Update
 BR2_TARGET_UBOOT_SPL_NAME help text
In-Reply-To: <1489489266-23161-1-git-send-email-jagan@openedev.com>
References: <1489489266-23161-1-git-send-email-jagan@openedev.com>
Message-ID: <20170314233957.659e5075@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 14 Mar 2017 16:31:05 +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan@amarulasolutions.com>
> 
> SPL is the name used for spl on i.MX6, so update the
> same on BR2_TARGET_UBOOT_SPL_NAME help text.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  boot/uboot/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied, after rewrapping the Config.in help text. We obviously
won't be listing the name of SPL images for all platforms, but having
two examples is nice, which is why I've applied your patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
