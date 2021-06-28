From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 28 Jun 2021 18:59:30 +0300
Subject: [Buildroot] [PATCH v1 1/1] package/fb-test-app: Move 'rosetta'
 prefix from VERSION to SITE
In-Reply-To: <20210628154008.2deb3874@windsurf>
References: <20210628130816.29769-1-andriy.shevchenko@linux.intel.com>
 <20210628154008.2deb3874@windsurf>
Message-ID: <YNnx4rjhCgMzieY1@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 28, 2021 at 03:40:08PM +0200, Thomas Petazzoni wrote:
> On Mon, 28 Jun 2021 16:08:16 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Move 'rosetta' prefix from VERSION to SITE to have version be
> > in a standard format.
> > 
> > Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks for the patch. However, are you sure you tested it? I believe
> this doesn't build, as the .hash file needs to be adjusted accordingly.

You are right, it wasn't tested on the repo which has this package enabled in
the configuration.
I'll send v2 which I have just tested:

--2021-06-28 18:58:28--  https://github.com/andy-shev/fb-test-app/archive/rosetta-1.1.1/fb-test-app-1.1.1.tar.gz
...
fb-test-app-1.1.1.tar.gz: OK (sha256: 45d490ed78a6e4425d9a760e81e99dc503af01704e17ab5bf186b87a31c5e3db)


-- 
With Best Regards,
Andy Shevchenko
