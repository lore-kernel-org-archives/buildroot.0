From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 18:13:19 +0200
Subject: [Buildroot] [PATCH] cmocka: bump to version 1.1.3
In-Reply-To: <20181003165853.23771-1-JoelsonCarl@gmail.com>
References: <20181003165853.23771-1-JoelsonCarl@gmail.com>
Message-ID: <20181008181319.26098fe7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Oct 2018 10:58:53 -0600, Joel Carlson wrote:
> Removes patch for upstream commit
> d677b564c2193a5cd381925c2eeaad6b23c6af2f
> 
> Adds hash for license file.
> 
> Adds patch to fix a build error encountered by br-mips64-n64-full
> toolchain about uintptr_t being declared twice.
> 
> Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
> ---
> Compile tested with utils/test-pkg -a
> ---
>  ...cmocka-cmake-fix-stack-protect-check.patch | 34 ------------------
>  ...ime-include-stdint.h-before-cmocka.h.patch | 35 +++++++++++++++++++
>  package/cmocka/cmocka.hash                    |  3 +-
>  package/cmocka/cmocka.mk                      |  2 +-
>  4 files changed, 38 insertions(+), 36 deletions(-)
>  delete mode 100644 package/cmocka/0001-cmocka-cmake-fix-stack-protect-check.patch
>  create mode 100644 package/cmocka/0001-examples-uptime-include-stdint.h-before-cmocka.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
