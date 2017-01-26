From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2017 21:03:29 +1300
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: Only CLI client
 depends on !uClibc
In-Reply-To: <20170125214358.14952-1-bernd.kuhls@t-online.de>
References: <20170125214358.14952-1-bernd.kuhls@t-online.de>
Message-ID: <20170126210329.4485928c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Jan 2017 22:43:58 +0100, Bernd Kuhls wrote:
> Tested using this minimal defconfig
> 
> BR2_KERNEL_HEADERS_3_4=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_PACKAGE_BLUEZ5_UTILS=y
> BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL=y
> BR2_PACKAGE_BLUEZ5_UTILS_TEST=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/bluez5_utils/Config.in | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
