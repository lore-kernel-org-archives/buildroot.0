From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 21:20:21 +0100
Subject: [Buildroot] [PATCH v1] libv4l: bump version to 1.16.1
In-Reply-To: <20181026192647.22826-1-ps.report@gmx.net>
References: <20181026192647.22826-1-ps.report@gmx.net>
Message-ID: <20181101212021.4636aa20@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Oct 2018 21:26:47 +0200, Peter Seiderer wrote:
> Removed patches:
> 
> - 0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch
>   (Upstream accepted, see [1])
> 
> - 0005-libv4lconvert-fix-compiler-warning.patch
>   (From upstream, see [2])
> 
> - 0006-v4l2-ctl-fix-glibc-2.28-build.patch
>   (From upstream, see [3])
> 
> Disable new qvidcap for now.
> 
> [1] https://git.linuxtv.org/v4l-utils.git/commit/?id=c28248deeb2d7fe43fcde948c00b9b8fa2bc1e8f
> [2] https://git.linuxtv.org/v4l-utils.git/commit/?id=380fe7d4548a99bfcfc1594b6f0b3dd2369978f1
> [3] https://git.linuxtv.org/v4l-utils.git/commit/?id=65e7b2a4076845d3932b88cb9c76f1fa4b78c32c
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...ional-copy-of-TEMP_FAILURE_RETRY-mac.patch | 39 ----------------
>  ...5-libv4lconvert-fix-compiler-warning.patch | 45 -------------------
>  .../0006-v4l2-ctl-fix-glibc-2.28-build.patch  | 30 -------------
>  package/libv4l/libv4l.hash                    |  4 +-
>  package/libv4l/libv4l.mk                      |  8 ++--
>  5 files changed, 6 insertions(+), 120 deletions(-)
>  delete mode 100644 package/libv4l/0003-libdvbv5-add-optional-copy-of-TEMP_FAILURE_RETRY-mac.patch
>  delete mode 100644 package/libv4l/0005-libv4lconvert-fix-compiler-warning.patch
>  delete mode 100644 package/libv4l/0006-v4l2-ctl-fix-glibc-2.28-build.patch

Applied to master, thanks. It would be nice to try to upstream the few
remaining patches we have on libv4l.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
