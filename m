From: hartleys <hartleys@visionengravers.com>
Date: Fri, 31 Oct 2008 14:42:14 -0400
Subject: [Buildroot] External toolchain support improvements
In-Reply-To: <20081030094501.66983ff9@surf>
References: <20081030094501.66983ff9@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909C2916F@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, October 30, 2008 1:45 AM, Thomas Petazzoni wrote:
> Improve external toolchain support
>
> * Do not put kernel-headers in the dependencies of BASE_TARGETS in
>   the case where BR2_TOOLCHAIN_SOURCE is not y. The kernel headers
>   are already supposed to be part of the external toolchain, so
>   there's no need to download, extract and install them.

What are the side effects if you use an external toolchain that was
built with a given kernel version, say 2.6.20.4, but use a newer kernel,
say 2.6.27.3?

Thanks,
Hartley
