From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 20 Nov 2019 21:41:17 +0100
Subject: [Buildroot] [PATCH 1/2] linux: change download method
In-Reply-To: <20191120185854.23820-1-angelo@amarulasolutions.com>
References: <20191120185854.23820-1-angelo@amarulasolutions.com>
Message-ID: <20191120214117.476cb931@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Wed, 20 Nov 2019 19:58:53 +0100
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> Downloading form https tarball is faster than clonig a git repo.
> BR2_LINUX_KERNEL_CUSTOM_GIT can be used as a fallback mechanism
> to downlad the CIP kernel with git.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  linux/Config.in | 4 ++--
>  linux/linux.mk  | 3 ++-
>  2 files changed, 4 insertions(+), 3 deletions(-)

I've applied both patches to next, thanks. However, you had apparently
based those patches on master, while they should have been based on
next (they are improvements/version bumps). And also, the commit title
should have mention that the change is related to the CIP kernel.
Indeed "linux: change download method" is a bit vague as it doesn't say
that it changes the download method for the CIP kernel. Ditto for the
second patch. I tweaked the commit titles when applying.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
