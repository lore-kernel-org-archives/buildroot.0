From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 22:42:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/brotli: security update to
 version 1.0.9
In-Reply-To: <20200907103432.836767-1-aperez@igalia.com>
References: <20200907103432.836767-1-aperez@igalia.com>
Message-ID: <20200907224220.3aa3a887@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Sep 2020 13:34:32 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Contains fixes for overflows when input chunks are larger than 2 GiB,
> an uninitialized data access, and minor correctness and performance
> improvements. There does not seem to be any CVEs filed, but there is
> a security notice in the release notes at:
> 
>   https://github.com/google/brotli/releases/tag/v1.0.9
> 
> Patch "0001-CMake-Allow-using-BUILD_SHARED_LIBS-to-choose-static.patch"
> is rebased against the latest upstream changes.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...g-BUILD_SHARED_LIBS-to-choose-static.patch | 92 ++++++++-----------
>  package/brotli/brotli.hash                    |  2 +-
>  package/brotli/brotli.mk                      |  2 +-
>  3 files changed, 41 insertions(+), 55 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
