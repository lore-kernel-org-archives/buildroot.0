From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Oct 2016 21:54:42 +0200
Subject: [Buildroot] [PATCH] bridge-utils: bump to version 1.6
In-Reply-To: <7f80513e7b1d337f33ae39842c4c89e916e940dc.1477591203.git.baruch@tkos.co.il>
References: <7f80513e7b1d337f33ae39842c4c89e916e940dc.1477591203.git.baruch@tkos.co.il>
Message-ID: <20161027215442.114b3600@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 27 Oct 2016 21:00:03 +0300, Baruch Siach wrote:
> Drop upstream patches.
> 
> Change download and homepage to kernel.org, and use .xz tarball.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0002-fix-for-kernel-headers-3.8+.patch         | 30 --------
>  package/bridge-utils/0003-sysfs-write-fixes.patch  | 81 ----------------------
>  package/bridge-utils/Config.in                     |  2 +-
>  package/bridge-utils/bridge-utils.hash             |  5 +-
>  package/bridge-utils/bridge-utils.mk               |  5 +-
>  5 files changed, 6 insertions(+), 117 deletions(-)
>  delete mode 100644 package/bridge-utils/0002-fix-for-kernel-headers-3.8+.patch
>  delete mode 100644 package/bridge-utils/0003-sysfs-write-fixes.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
