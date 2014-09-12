From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Sep 2014 10:57:04 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <5412B494.4070607@imgtec.com>
References: <20140912063012.AF99B100DEE@stock.ovh.net>
 <20140912101105.1e932cb8@free-electrons.com>
 <5412B494.4070607@imgtec.com>
Message-ID: <20140912105704.065664a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Fri, 12 Sep 2014 09:53:40 +0100, Vicente Olivert Riera wrote:

> One of them (sa_restorer) is very close to be fixed upstream. Maybe 
> today? Hopefully.
> 
> To fix the other one (si_timerid) we need to patch uClibc, but that 
> patch will add some members to a struct, so that woulb be an ABI 
> breakage. We need to talk first to the person in maintaining uClibc for 
> MIPS and see what he thinks about this.

So in the mean time, let's have a patch that disables building strace
on MIPS with uClibc, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
