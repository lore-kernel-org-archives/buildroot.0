From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Apr 2020 23:00:00 +0200
Subject: [Buildroot] [PATCH] support/testing: update basic toolchain to
 bootlin bleeding-edge 2018.11-1
In-Reply-To: <20200402215718.161290-1-romain.naour@gmail.com>
References: <20200402215718.161290-1-romain.naour@gmail.com>
Message-ID: <20200404230000.5a7362c4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  2 Apr 2020 23:57:18 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Update the toolchain being used by the testsuite infra.
> 
> The new toolchain 2018.11-1 is based on gcc 8.2, uClibc-ng 1.0.30,
> linux-headers 4.14 and binutils 2.31.1.
> Enable BR2_TOOLCHAIN_HAS_THREADS_DEBUG that is now required.
> 
> The old toolchain 2017.05 is based on gcc 4.9, uClibc-ng 1.0.25,
> linux-headers 3.10 and binutils 2.27.
> 
> Tested with gitlab
> https://gitlab.com/kubu93/buildroot/pipelines/132376578
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> (note some tests failed but it's not related to the toolchain version bump)
> ---
>  support/testing/infra/basetest.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
