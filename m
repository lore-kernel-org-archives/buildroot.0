From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Sat, 15 Jun 2019 19:34:14 +0300
Subject: [Buildroot] [PATCH 1/1] package/busybox: update S10mdev
In-Reply-To: <mailman.4931.1560533212.86899.buildroot@busybox.net>
References: <mailman.4931.1560533212.86899.buildroot@busybox.net>
Message-ID: <20190615163414.GU9224@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Wed, May 29, 2019 at 04:25:28PM +0200, Titouan Christophe wrote:
> > Avoid race conditions in mdev invocations
> > * use the uevent daemon if possible
> > * fallback to hotplug (as before) and initialize /dev/mdev.seq
> > * otherwise print an error message and do nothing else

> Thanks!
> 
> Tested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> What are we going to do with this?
> As of today Buildroot can not be used with mdev in current state.

-- 
With Best Regards,
Andy Shevchenko
