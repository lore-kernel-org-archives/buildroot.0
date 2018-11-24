From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:12:13 +0100
Subject: [Buildroot] [PATCH v3 1/3] merge_config.sh: Fix merging
 buildroot config files
In-Reply-To: <20181114071156.10453-2-afshin.nasser@gmail.com>
References: <20181114071156.10453-1-afshin.nasser@gmail.com>
 <20181114071156.10453-2-afshin.nasser@gmail.com>
Message-ID: <20181124101213.4483fd5b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Nov 2018 10:41:54 +0330, Nasser Afshin wrote:
> This patch allows us to define config prefix with CONFIG_ environment
> variable.
> 
> By setting the proper config prefix, we will have proper 'redundant
> configuration warnings' when we use '-r -m' options.
> 
> This is actually already in mainline for v4.20-rc1:
> 2cd3faf87d2d8f6123adf34741b9a7b98828a76f
> ("merge_config.sh: Allow to define config prefix")
> 
> Signed-off-by: Nasser Afshin <afshin.nasser@gmail.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  support/kconfig/merge_config.sh                    |  7 ++++-
>  ...e_config.sh-Allow-to-define-config-prefix.patch | 31 ++++++++++++++++++++++
>  support/kconfig/patches/series                     |  1 +
>  3 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 support/kconfig/patches/20-merge_config.sh-Allow-to-define-config-prefix.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
