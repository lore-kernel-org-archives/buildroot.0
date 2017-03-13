From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 13 Mar 2017 17:54:44 +0200
Subject: [Buildroot] cmake is not building anymore
In-Reply-To: <1489417019.20145.214.camel@linux.intel.com>
References: <1489417019.20145.214.camel@linux.intel.com>
Message-ID: <1489420484.20145.218.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2017-03-13 at 16:56 +0200, Andy Shevchenko wrote:
> Hi!
> 
> After update to 2017.02 followed by origin/2017.02.x cmake fails to
> compile.
> 
> output/build/host-cmake-
> 3.6.3/Utilities/cmlibarchive/libarchive/archive_hmac.c: In function
> ?__hmac_sha1_cleanup?:
> output/build/host-cmake-
> 3.6.3/Utilities/cmlibarchive/libarchive/archive_hmac.c:203:24: error:
> dereferencing pointer to incomplete type ?archive_hmac_sha1_ctx {aka
> struct hmac_ctx_st}?
> ? memset(ctx, 0, sizeof(*ctx));
> ????????????????????????^~~~
> 
> Is it known issue?

Just did a clean build. Issue still stays.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
