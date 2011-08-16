From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 16 Aug 2011 07:44:44 -0500
Subject: [Buildroot] /run/udev missing ?
In-Reply-To: <CALR4fELxZAaArCZ9c7SyJzOusP4V6ZBDEtcDhna1yUFFQH7E1A@mail.gmail.com>
References: <1313137798.1017.5.camel@sven> <1313484062.2127.13.camel@sven>
 <CALR4fELxZAaArCZ9c7SyJzOusP4V6ZBDEtcDhna1yUFFQH7E1A@mail.gmail.com>
Message-ID: <201108160744.47656.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue August 16 2011, Diego Iastrubni wrote:
> On Tue, Aug 16, 2011 at 11:40 AM, Sven Neumann <s.neumann@raumfeld.com>wrote:
> 
> >
> > Do you have a suggestion on how to use udev with a kernel that does not
> > yet have this option? We are stuck with 2.6.31 on one of our platforms
> > and I haven't been able to get udev working with recent buildroot on
> > this platform.
> >
> >
> This init.d file woks for me on 2.6.32. I am using tmpfs for mounting udev.
>

Isn't: mount -t ramfs
A ram disk on the older kernels rather than a tmpfs (-t tmpfs) ?

Mike
> 
> Note that for udev 173 you will also need  a patch to compile with older
> toolchains (look for in in the ML or the bugzilla).
> 
