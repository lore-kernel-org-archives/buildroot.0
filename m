From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jul 2017 10:28:55 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-11
In-Reply-To: <20170712180121.GA5484@itchy>
References: <20170712063101.49E7C21D7B@mail.free-electrons.com>
 <20170712180121.GA5484@itchy>
Message-ID: <20170713102855.5cbef4ef@windsurf.orange-hotspot.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jul 2017 20:01:21 +0200, Eric Le Bihan wrote:

> >       x86_64 |                skalibs-2.5.1.1 | http://autobuild.buildroot.net/results/ad7f20f55645b71cb44aa816200e8c31329bb351
> >  
> 
> The build fails as follows:
> 
> ```
> src/libstddjb/stralloc_ready_tuned.c:8:5: internal compiler error: Segmentation fault
>  int stralloc_ready_tuned (stralloc *sa, size_t n, size_t base, size_t a, size_t b)
> ```
> 
> An ICE? This is puzzling: I successfully built the defconfig on a Debian
> Jessie machine. What is the configuration of the autobuilder?

Please ignore this build result. It was happening on gcc68, which
caused numerous random issues. Peter has shut down the autobuilder
instance on this machine, which doesn't work reliably.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
