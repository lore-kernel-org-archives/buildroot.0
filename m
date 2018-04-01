From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:49:44 +0200
Subject: [Buildroot] [PATCH v2 04/37] check-package: enable for boot/
In-Reply-To: <20180401050850.5701-5-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-5-ricardo.martincoski@gmail.com>
Message-ID: <20180401084944.29a512be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:17 -0300, Ricardo Martincoski wrote:
> This directory can benefit from this script to prevent common mistakes
> when submitting patches.
> 
> In order to accomplish this:
> Do not ignore anymore files from the boot/ directory.
> Ignore boot/barebox/barebox.mk as it declares a package infra and not a
> package itself.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> ---
> Changes v1 -> v2:
>   - no changes
> ---
>  utils/check-package | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
