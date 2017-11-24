From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 24 Nov 2017 15:27:33 +0200
Subject: [Buildroot] [PATCH v1] busybox: Fix rtcwake to use /dev/rtc0
 properly
In-Reply-To: <b2f0d3bf-b8a1-c948-2013-35dc605c2cbd@mind.be>
References: <20171123183914.71769-1-andriy.shevchenko@linux.intel.com>
 <b2f0d3bf-b8a1-c948-2013-35dc605c2cbd@mind.be>
Message-ID: <1511530053.25007.435.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2017-11-23 at 23:46 +0100, Arnout Vandecappelle wrote:
>  Hi Andy,
> 
> On 23-11-17 19:39, Andy Shevchenko wrote:
> > rtcwake from busybox has failed in case the /dev/rtc is a symlink
> > (which is default case for udev enabled systems) due to wrong
> > pathname
> > used for a sysfs wakeup attribute.
> 
>  In Buildroot, we don't accept "feature patches" for packages.

To be honest it's not a feature patch at all. It fixes (okay,
workarounds) obvious bug in rtcwake logic. Easy to reproduce. 100%
reproducible.

>  We try to limit
> to patches that fix the build or complete breakage, sometimes also to
> make it
> work together with other packages. I think this patch doesn't fall in
> that category.

Whatever, your choice at the end.

> 
>  For sure, you should first send the patch upstream.

Are you sure I didn't?
The policy of Busybox mailing list is to reject (I'm not subscriber and
after a such policy would not like to be one). Happy contribution!

>  Particularly in the case of
> busybox, Denys often proposes improved patches. If it gets accepted
> upstream,
> then we can consider including it in Buildroot as well.

Good luck!

I'm done with it. If Denys is caring about project he will take the
series (there are more patches than just one) from his private mailbox
(Cc was there as well).

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
