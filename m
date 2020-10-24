From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:52:41 +0200
Subject: [Buildroot] [PATCH v2 1/4] package/libabseil-cpp: bump version
 to 20200923.2
In-Reply-To: <20201021165005.641-1-buildroot@heine.tech>
References: <20201021165005.641-1-buildroot@heine.tech>
Message-ID: <20201024225241.1c6a68bb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 21 Oct 2020 18:50:01 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> * removed patch 0003 as it is now in upstream
> * removed patch 0002 as the logic has been reworked
> * adjusted patch 0001 offset
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> ---
>  ...0001-force-position-independent-code.patch |  2 +-
>  ...g-use-execinfo.h-only-when-available.patch | 63 ---------------
>  .../0003-Fix-build-on-riscv32-675.patch       | 77 -------------------
>  package/libabseil-cpp/libabseil-cpp.hash      |  2 +-
>  package/libabseil-cpp/libabseil-cpp.mk        |  2 +-
>  5 files changed, 3 insertions(+), 143 deletions(-)
>  delete mode 100644 package/libabseil-cpp/0002-absl-debugging-use-execinfo.h-only-when-available.patch
>  delete mode 100644 package/libabseil-cpp/0003-Fix-build-on-riscv32-675.patch

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
