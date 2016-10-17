From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Oct 2016 17:02:40 +0200
Subject: [Buildroot] Update of pre-built Buildroot toolchains
In-Reply-To: <57E3D8F9.4020109@imgtec.com>
References: <20160921210722.1b078ab1@free-electrons.com>
 <57E3D8F9.4020109@imgtec.com>
Message-ID: <20161017170240.1a014f88@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 18:43:29 +0530, Rahul Bedarkar wrote:

> >   * Almost all toolchains have been switched to the default of gcc 5.x.
> >     There are still a few toolchains that intentionally use different
> >     gcc version: some using gcc 6.x, some using gcc 4.8.x.
> >
> >   * The ARC toolchain has been updated with the latest version of the
> >     ARC toolchain components.
> >
> >   * The Blackfin toolchain has the latest uClibc fix.  
> 
> It looks like bfin config on autobuilder is not updated to use new 
> pre-build toolchain.

Indeed. I've updated all toolchains now, freshly rebuilt.

Thanks for reporting the issue!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
