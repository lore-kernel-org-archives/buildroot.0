From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Aug 2014 16:29:08 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-07-31
In-Reply-To: <53DBA248.7050407@imgtec.com>
References: <20140801063013.6BF72101443@stock.ovh.net>
 <53DBA248.7050407@imgtec.com>
Message-ID: <20140801162908.38353774@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 1 Aug 2014 15:20:56 +0100, Vicente Olivert Riera wrote:
> On 08/01/2014 07:30 AM, Thomas Petazzoni wrote:
> > Build statistics for 2014-07-31
> > ===============================
> >    mips64el |             libvncserver-0.9.9 | NOK | http://autobuild.buildroot.net/results/3bf952fe2e3ebd8308e8ac5001896474790249d9/
> 
> I can't reproduce this failure. It should be a problem of the 
> autobuilder or maybe someone already fixed this bug.

Yeah, the problem was not MIPS related at all here. Caused by the
static linking and libtool changes we have been doing with Gustavo over
the last 2 days. This issue is already fixed now.

> 
> >        mips | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/081b58cae5ce05c32811a1d1d442e66828d9e73e/
> 
> Reported upstream:
>    https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=756764

Thanks. Maybe you should send a mail to the ltrace-devel mailing list.
Even though the ltrace web site says to report bugs on the Debian bug
track system, I am not sure the upstream maintainer of ltrace will
actually look there, while he seems to be responsive on the mailing
list.

But well, let's wait a few days and see if there's a reaction.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
