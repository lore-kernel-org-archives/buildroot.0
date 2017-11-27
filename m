From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:28:48 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/samba4: bump version to
 4.7.3
In-Reply-To: <20171127062406.3845-1-bernd.kuhls@t-online.de>
References: <20171127062406.3845-1-bernd.kuhls@t-online.de>
Message-ID: <20171127092848.4057c222@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 27 Nov 2017 07:24:06 +0100, Bernd Kuhls wrote:
> Rebased 0001-libreplace-disable-libbsd-support.patch.
> 
> Added iconv-related entry to samba4-cache.txt to fix configure error:
> Cross answers file
>  /home/buildroot/test-samba4/armv5-ctng-linux-gnueabi/build/samba4-4.7.3/cache.txt
>  is incomplete
> 
> with this defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_PACKAGE_LIBICONV=y
> BR2_PACKAGE_SAMBA4=y
> BR2_PACKAGE_SAMBA4_AD_DC=y
> BR2_PACKAGE_SAMBA4_ADS=y
> BR2_PACKAGE_SAMBA4_SMBTORTURE=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/samba4/0001-libreplace-disable-libbsd-support.patch | 11 +++++++----
>  package/samba4/samba4-cache.txt                             |  1 +
>  package/samba4/samba4.hash                                  |  2 +-
>  package/samba4/samba4.mk                                    |  2 +-
>  4 files changed, 10 insertions(+), 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
