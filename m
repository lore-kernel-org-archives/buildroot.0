From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:08:18 +0200
Subject: [Buildroot] [PATCH v2 12/37] check-package: enable for linux/
In-Reply-To: <20180401050850.5701-13-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
 <20180401050850.5701-13-ricardo.martincoski@gmail.com>
Message-ID: <20180401090818.7fb458bc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Apr 2018 02:08:25 -0300, Ricardo Martincoski wrote:
> This directory can benefit from this script to prevent common mistakes
> when submitting patches.
> 
> In order to accomplish this:
> Do not ignore anymore files from the linux/ directory.
> Ignore missing LINUX_EXT_ prefix as the variables for linux extensions
> do not use it.
> Ignore this symbol:
>  - LINUX_EXTENSIONS: defined by each linux extension, used by
>    linux/linux.mk.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
> Changes v1 -> v2:
>   - remove spurious info from commit log (I first created the series
>     changing the check-package and then fixing the package files; when I
>     rebased to allow partial apply of the series, the info "do not
>     ignore this symbol" became obsolete since it is fixed in a previous
>     patch);
> ---
>  utils/check-package             | 1 +
>  utils/checkpackagelib/lib_mk.py | 3 +++
>  2 files changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
