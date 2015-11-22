From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Nov 2015 13:59:28 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/eudev: bump version to
 3.1.5
In-Reply-To: <1448186456-1069-1-git-send-email-bernd.kuhls@t-online.de>
References: <1448186456-1069-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151122135928.148e3fcd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 22 Nov 2015 11:00:56 +0100, Bernd Kuhls wrote:
> Remove two patches applied upstream:
> https://github.com/gentoo/eudev/commit/0e2be0c217028e73073e7f9ccb010cc8b4d756db
> https://github.com/gentoo/eudev/commit/24ccb6ebc5e13a128aaedd3a2eb52eef3adf6dcd
> 
> Due to the removed patches autoreconf is not necessary anymore.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../eudev/0002-build-sys-check-for-mallinfo.patch  | 93 ----------------------
>  .../eudev/0003-build-sys-check-for-strndupa.patch  | 69 ----------------
>  package/eudev/eudev.hash                           |  4 +-
>  package/eudev/eudev.mk                             |  7 +-
>  4 files changed, 3 insertions(+), 170 deletions(-)
>  delete mode 100644 package/eudev/0002-build-sys-check-for-mallinfo.patch
>  delete mode 100644 package/eudev/0003-build-sys-check-for-strndupa.patch

Applied to next, thanks.

We have one remaining patch for eudev, which seems quite suitable for
upstream inclusion. Could you submit it upstream?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
