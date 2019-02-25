From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 11:49:24 +0100
Subject: [Buildroot] [PATCH v2] package/imagemagick: bump to version
 7.0.8-27
In-Reply-To: <1550940815-4821-1-git-send-email-angelo@amarulasolutions.com>
References: <1550940815-4821-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20190225114924.3aef6e7f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Sat, 23 Feb 2019 17:53:35 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> 
> This patch bumps imagemagick to version 7.0.8-27
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> v1 -> v2:
> 
> Fixed LICENSE hash
> 
>  package/imagemagick/imagemagick.hash | 4 ++--
>  package/imagemagick/imagemagick.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
> index 9d5a395..09bfb2a 100644
> --- a/package/imagemagick/imagemagick.hash
> +++ b/package/imagemagick/imagemagick.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256 e7c1b19923bb97ed456c78b63b3259b809ebc8e3967c6d086450370c67eedf06  7.0.7-39.tar.gz
> -sha256 2318cc05bbd2c25c1b2d13af1aadccc45b9cf6f94757421ae59a3c8ea9064f1c  LICENSE
> +sha256 94866968a447f8f92a969bf5342d612d05a64c71fc75e63bb2d8ecf887dc7fa2  7.0.8-27.tar.gz
> +sha256 5b47db932754743460eba7a226aea85b63e3408d3c7affb4d0117f70c9594ded  LICENSE

What are the changes in the LICENSE file ? We don't want to blindly
update the hash just to "make things work". The hash is here to detect
changes in the license file, and make sure we look at the differences
between the old and new license files when updating the hash. So could
you update the commit log with the details of what changed in the
license file ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
