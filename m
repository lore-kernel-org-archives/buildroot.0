From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Wed, 16 Apr 2008 11:33:34 -0700
Subject: [Buildroot] uclibc make fails building libpthread for powerpc32
In-Reply-To: <20080416182142.GA22496@real.realitydiluted.com>
References: <D61182AC8012EA4EBC531B3AF23BE10958329C@tranzeo-mail2.12stewart.tranzeo.com>
	<D61182AC8012EA4EBC531B3AF23BE1095832A0@tranzeo-mail2.12stewart.tranzeo.com>
	<20080416182142.GA22496@real.realitydiluted.com>
Message-ID: <D61182AC8012EA4EBC531B3AF23BE1095832CC@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Steve,

That is probably why I also later get an unresolved external to
__wrap_nanosleep later when trying to use libpthread.so.1


Regards,

Darcy


-----Original Message-----
From: sjhill@realitydiluted.com [mailto:sjhill at realitydiluted.com] 
Sent: Wednesday, April 16, 2008 11:22 AM
To: Darcy Watkins
Cc: buildroot at uclibc.org
Subject: Re: [Buildroot] uclibc make fails building libpthread for
powerpc32

On Wed, Apr 16, 2008 at 08:07:49AM -0700, Darcy Watkins wrote:
> I see the compile error below attempting to build buildroot with POSIX
> pthreads selected instead of linux pthreads.  
> 
PowerPC NPTL is not supported in uClibc currently. Your hacks let you
build, but your system will not run.

-Steve
