From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Jun 2021 15:40:08 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/fb-test-app: Move 'rosetta'
 prefix from VERSION to SITE
In-Reply-To: <20210628130816.29769-1-andriy.shevchenko@linux.intel.com>
References: <20210628130816.29769-1-andriy.shevchenko@linux.intel.com>
Message-ID: <20210628154008.2deb3874@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Jun 2021 16:08:16 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Move 'rosetta' prefix from VERSION to SITE to have version be
> in a standard format.
> 
> Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for the patch. However, are you sure you tested it? I believe
this doesn't build, as the .hash file needs to be adjusted accordingly.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
