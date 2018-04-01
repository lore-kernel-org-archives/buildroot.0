From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:03:23 +0200
Subject: [Buildroot] [PATCH v2 02/37] check-package: enable for arch/
 and system/
In-Reply-To: <20180401050850.5701-3-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-3-ricardo.martincoski@gmail.com>
Message-ID: <20180401080323.50a79c61@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:15 -0300, Ricardo Martincoski wrote:
> These directories can benefit from this script to prevent common
> mistakes when submitting patches.
> 
> In order to accomplish this:
> Do not ignore anymore files from these directories.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  utils/check-package | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks. I've actually applied this commit *after*
the commits that fix the coding style issues in arch/ and system/, so
the order of commits is not the same as the order of the patches in
your patch series.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
