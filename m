From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 20 Jun 2019 13:10:28 +0300
Subject: [Buildroot] [PATCH 2/3] package/busybox: convert S10mdev to the
 canonical init script format
In-Reply-To: <20190619164257.183607-3-titouan.christophe@railnova.eu>
References: <20190619164257.183607-1-titouan.christophe@railnova.eu>
 <20190619164257.183607-3-titouan.christophe@railnova.eu>
Message-ID: <20190620101028.GS9224@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 19, 2019 at 06:42:56PM +0200, Titouan Christophe wrote:
> Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

> -	find /sys/ -name modalias -print0 | xargs -0 sort -u | tr '\n' '\0' | \
> -	    xargs -0 modprobe -abq

> +	find /sys/ -name modalias -print0 | \
> +		xargs -0 sort -u | \
> +		tr '\n' '\0' | \
> +		xargs -0 modprobe -abq

How this indentation change related to the topic?

-- 
With Best Regards,
Andy Shevchenko
