From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 22:11:44 +0200
Subject: [Buildroot] [PATCH 03/14] boot/at91bootstrap3: URL update
In-Reply-To: <1537449899-9576-3-git-send-email-matthew.weber@rockwellcollins.com>
References: <1537449899-9576-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537449899-9576-3-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180920221144.73ae7cb2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Sep 2018 08:24:48 -0500, Matt Weber wrote:
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  boot/at91bootstrap3/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
> index 614363c..4534b4e 100644
> --- a/boot/at91bootstrap3/Config.in
> +++ b/boot/at91bootstrap3/Config.in
> @@ -10,6 +10,9 @@ config BR2_TARGET_AT91BOOTSTRAP3
>  	  - Physical media algorithm such as DataFlash, NandFlash, NOR
>  	    Flash...
>  
> +

One too many newline.

> +	  https://www.at91.com/linux4sam/bin/view/Linux4SAM/AT91Bootstrap

And the commit title was wrong: you're not updating the URL, but adding
it.

Applied after fixing those issues.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
