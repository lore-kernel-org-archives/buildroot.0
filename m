From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 May 2018 21:23:31 +0200
Subject: [Buildroot] [PATCH 2/5] package/stress-ng: bump version,
 fix to use system xattr header
In-Reply-To: <e3aef063f700d64bcb91d0b139ebef0a834e85b3.1525717511.git.yann.morin.1998@free.fr>
References: <cover.1525717511.git.yann.morin.1998@free.fr>
 <e3aef063f700d64bcb91d0b139ebef0a834e85b3.1525717511.git.yann.morin.1998@free.fr>
Message-ID: <20180507212331.5d66b669@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  7 May 2018 20:25:17 +0200, Yann E. MORIN wrote:

> diff --git a/package/stress-ng/0001-xattr-from-libc.patch b/package/stress-ng/0001-xattr-from-libc.patch
> new file mode 100644
> index 0000000000..0064b54470
> --- /dev/null
> +++ b/package/stress-ng/0001-xattr-from-libc.patch
> @@ -0,0 +1,49 @@
> +Use system <sys/xattr.h>
> +
> +The one from attr is no longer installed with latest version.
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Git-formatted patch, please ?

Git repo is at git://kernel.ubuntu.com/cking/stress-ng.git.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
