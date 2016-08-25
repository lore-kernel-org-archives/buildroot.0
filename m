From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 23:44:49 +0200
Subject: [Buildroot] [PATCH v1 1/9] package/acpica: Add host
 configuration to the tool
In-Reply-To: <1472133887-34746-2-git-send-email-andriy.shevchenko@linux.intel.com>
References: <1472133887-34746-1-git-send-email-andriy.shevchenko@linux.intel.com>
 <1472133887-34746-2-git-send-email-andriy.shevchenko@linux.intel.com>
Message-ID: <20160825234449.12ab1348@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Aug 2016 17:04:39 +0300, Andy Shevchenko wrote:
> The ACPI excerpts, which would be added to an initial RAM disk image, require
> to be compiled first. iasl tool from acpica package helps do that.
> 
> Enable host variant of the application to be built.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This patch generally looks good, but I'm not entirely sure we need this
package to be visible in menuconfig. This depends on the outcome of the
discussion for PATCH 3/9.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
