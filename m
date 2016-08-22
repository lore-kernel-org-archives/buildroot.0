From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 22 Aug 2016 15:46:56 +0300
Subject: [Buildroot] [PATCH] [RFC] platform: update galileo to 3.14
 kernel
In-Reply-To: <1471868735-13766-1-git-send-email-padraig.connolly@intel.com>
References: <1471868735-13766-1-git-send-email-padraig.connolly@intel.com>
Message-ID: <1471870016.4887.210.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2016-08-22 at 13:25 +0100, Padraig James Connolly wrote:
> Updating kernel for Galileo board BSP from 3.8 to 3.14
> ?*Changed board defconfig to pull new 3.14 kernel
> ?*New kernel config file for 3.14 kernel
> ?*Changed defconfig to use new kernel config
> ?*Removed old 3.8 kernel config

What is not working with the upstream kernel?

Btw, we are preparing some common infrastructure for Intel boards for
Buildroot (*), it would be nice to re-integrate Galileo there as well.

(*) Will be published at some point later when we have done some
testing, though seems you are working for Intel, so, we can show you
this earlier.

> 
> ?Signed-off-by: Padraig Connolly <padraig.connolly@intel.com>
> ---
> ?board/intel/galileo/linux-3.14.config | 308
> ++++++++++++++++++++++++++++++++++
> ?board/intel/galileo/linux-3.8.config??| 307 -----------------------
> ----------


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
