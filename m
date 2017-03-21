From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 21 Mar 2017 20:53:26 +0100
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable wordexp
	functionality
In-Reply-To: <20170321160237.31058-2-andriy.shevchenko@linux.intel.com>
References: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
 <20170321160237.31058-2-andriy.shevchenko@linux.intel.com>
Message-ID: <20170321195326.GE28589@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Andy Shevchenko wrote,

> The commit d7c54cb0c0cf ("bluez5_utils: not available with uClibc")
> disables bluez5_utils (most of them) to be built with uClibc. Looking to
> the development of BlueZ user space support that commit basically makes
> the bluez5_utils package somewhat piece of junk. Since bluez5_utils 5.44
> deprecates all previously used tools and focuses on btmgmt and
> bluetoothctl we need to restore status quo.

You can add my Acked-By. It will allow to use more applications and
I think it is just a minor size increase.

Looking forward to your size comparison requested by Thomas,

Thanks
 Waldemar
