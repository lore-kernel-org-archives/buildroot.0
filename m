From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 22:12:59 +0200
Subject: [Buildroot] [PATCH 02/14] boot/at91bootstrap: URL update
In-Reply-To: <1537449899-9576-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180920221259.72b5b016@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 08:24:47 -0500, Matt Weber wrote:
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  boot/at91bootstrap/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
> index 0f6430f..3d649b1 100644
> --- a/boot/at91bootstrap/Config.in
> +++ b/boot/at91bootstrap/Config.in
> @@ -10,6 +10,8 @@ config BR2_TARGET_AT91BOOTSTRAP
>  	  - Physical media algorithm such as DataFlash, NandFlash, NOR
>  	    Flash...
>  
> +	  https://www.at91.com/linux4sam/bin/view/Linux4SAM/LegacyAT91Bootstrap

Actually, this one should use:

	  https://www.at91.com/linux4sam/bin/view/Linux4SAM/LegacyAT91Bootstrap

which you have used for at91dataflashboot, but at91dataflashboot is a
different thing, which no longer has any upstream location.

Perhaps your script should support a way of specifying "yeah, there is
no upstream location" in an explicit way.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
