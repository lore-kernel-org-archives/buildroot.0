From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 22:28:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/eudev: bump version to 3.2.2
In-Reply-To: <20170420070613.19595-1-bernd.kuhls@t-online.de>
References: <20170420070613.19595-1-bernd.kuhls@t-online.de>
Message-ID: <20170420222820.136846d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Apr 2017 09:06:13 +0200, Bernd Kuhls wrote:
> Removed patch 0001 applied upstream:
> https://github.com/gentoo/eudev/commit/c0f63850ad29ec978d070a08b816dc2bfca337e3
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0002-missing-defines-for-old-kernels.patch     | 44 ----------------------
>  package/eudev/eudev.hash                           |  4 +-
>  package/eudev/eudev.mk                             |  2 +-
>  3 files changed, 3 insertions(+), 47 deletions(-)
>  delete mode 100644 package/eudev/0002-missing-defines-for-old-kernels.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
