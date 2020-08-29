From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 16:30:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/trace-cmd: bump to version 2.9.1
In-Reply-To: <20200829134529.17445-1-egorenar-dev@posteo.net>
References: <20200829134529.17445-1-egorenar-dev@posteo.net>
Message-ID: <20200829163048.38790541@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Aug 2020 15:45:29 +0200
Alexander Egorenkov <egorenar-dev@posteo.net> wrote:

> - This also fixes gcc 10 issues

Do we have autobuilder reports of those build issues ?

> diff --git a/package/trace-cmd/0001-Cross-compilation-fixes.patch b/package/trace-cmd/0001-Cross-compilation-fixes.patch
> new file mode 100644
> index 0000000000..07428204fe
> --- /dev/null
> +++ b/package/trace-cmd/0001-Cross-compilation-fixes.patch

All patches need a description + Signed-off-by, and should be generated
with "git format-patch -N" when the upstream project uses git, which I
guess is the case here.

> diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
> index c6447f34d4..91c0512d5f 100644
> --- a/package/trace-cmd/trace-cmd.hash
> +++ b/package/trace-cmd/trace-cmd.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256 3b3f564cc6ee30341051ccb7589b42f3abe4e676a21c029c7c127c7edf5bdcf0  trace-cmd-trace-cmd-v2.7.tar.gz
> -sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> +sha256 f7d591ac13ac3de004aa69fa3c2d333f620bb29ad0fec064ec215f488588b333  trace-cmd-trace-cmd-v2.9.1.tar.gz
> +sha256 b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING

The hash of COPYING has changed, what are the changes ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
