From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 14:26:41 +0200
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable wordexp
 functionality
In-Reply-To: <20170321160237.31058-2-andriy.shevchenko@linux.intel.com>
References: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
 <20170321160237.31058-2-andriy.shevchenko@linux.intel.com>
Message-ID: <20170429142641.48ba4a8f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 18:02:36 +0200, Andy Shevchenko wrote:
> The commit d7c54cb0c0cf ("bluez5_utils: not available with uClibc")
> disables bluez5_utils (most of them) to be built with uClibc. Looking to
> the development of BlueZ user space support that commit basically makes
> the bluez5_utils package somewhat piece of junk. Since bluez5_utils 5.44
> deprecates all previously used tools and focuses on btmgmt and
> bluetoothctl we need to restore status quo.
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  package/uclibc/uClibc-ng.config | 1 +
>  1 file changed, 1 insertion(+)

I've applied, after rewriting the commit message. If there's some
bluez5_utils improvements that can be done now that wordexp is enabled,
please send patches. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
