From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 23:47:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/grpc: bump version to 1.31.0
In-Reply-To: <20200813144549.1262366-3-buildroot@heine.tech>
References: <20200813144549.1262366-1-buildroot@heine.tech>
 <20200813144549.1262366-3-buildroot@heine.tech>
Message-ID: <20200816234707.22ca85a1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Aug 2020 16:45:49 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> Related changes:
>  - add dependency on Google RE2 package
>  - update patches to new offsets
> 
> Tested on Ubuntu 20.04
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  .../grpc/0001-target-build-using-host-plugin.patch   |  4 ++--
>  ...detect-the-availability-of-pthread_setname_.patch |  7 +++----
>  package/grpc/Config.in                               |  3 ++-
>  package/grpc/grpc.hash                               |  2 +-
>  package/grpc/grpc.mk                                 | 12 +++++++-----
>  5 files changed, 15 insertions(+), 13 deletions(-)

Applied to next, thanks. Note that you had forgotten to propagate the
BR2_TOOLCHAIN_HAS_ATOMIC dependency of the re2 package, but since I
dropped that dependency for now, that's OK.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
