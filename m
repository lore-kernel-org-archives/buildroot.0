From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Dec 2016 14:34:05 +0100
Subject: [Buildroot] [PATCH v1 1/3] efivar: bump to version 30
In-Reply-To: <20161128163553.173811-2-andriy.shevchenko@linux.intel.com>
References: <20161128163553.173811-1-andriy.shevchenko@linux.intel.com>
 <20161128163553.173811-2-andriy.shevchenko@linux.intel.com>
Message-ID: <20161203143405.0e4a8a54@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 18:35:51 +0200, Andy Shevchenko wrote:
> Use newest release.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This update is causing a large number of build failures, see:

   http://autobuild.buildroot.net/?reason=efivar-30

Could you have a look?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
