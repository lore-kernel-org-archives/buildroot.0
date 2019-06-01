From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 12:36:07 +0200
Subject: [Buildroot] [PATCH] dropbear: add build opt to provide file
 with localoptions.h
In-Reply-To: <20190529102706.31865-1-alexandru.ardelean@analog.com>
References: <20190523121115.26098-1-ardeleanalex@gmail.com>
 <20190529102706.31865-1-alexandru.ardelean@analog.com>
Message-ID: <20190601123607.728981a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexandru,

Thanks for this new iteration!

On Wed, 29 May 2019 13:27:06 +0300
Alexandru Ardelean <ardeleanalex@gmail.com> wrote:

> From: Alexandru Ardelean <ardeleanalex@gmail.com>
> 
> Based on discussion here:
>   https://patchwork.ozlabs.org/patch/1104071/
> Thomas suggested to implement an option to specify a file that gets
> appended to the `localoptions.h` of dropbear, as well as providing the code
> for this
> 
> This patch implements the changes.
> The patch was tested successfully with the DO_MOTD option, which the
> initial patch tried to address.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> ---
> Changelog v1 -> v2:
> * re-implemented with suggestions from Thomas
> * tested patch with `#define DO_MOTD 1` option

I've applied to next, after renaming the option. To me
BR2_PACKAGE_DROPBEAR_CONFIG_FILE sounded like the configuration file
you would have in /etc/dropbear/ for example. I also reworked teh
commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
