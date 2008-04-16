From: sjhill at realitydiluted.com <sjhill@realitydiluted.com>
Date: Wed, 16 Apr 2008 13:21:42 -0500
Subject: [Buildroot] uclibc make fails building libpthread for powerpc32
In-Reply-To: <D61182AC8012EA4EBC531B3AF23BE1095832A0@tranzeo-mail2.12stewart.tranzeo.com>
References: <D61182AC8012EA4EBC531B3AF23BE10958329C@tranzeo-mail2.12stewart.tranzeo.com>
	<D61182AC8012EA4EBC531B3AF23BE1095832A0@tranzeo-mail2.12stewart.tranzeo.com>
Message-ID: <20080416182142.GA22496@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 16, 2008 at 08:07:49AM -0700, Darcy Watkins wrote:
> I see the compile error below attempting to build buildroot with POSIX
> pthreads selected instead of linux pthreads.  
> 
PowerPC NPTL is not supported in uClibc currently. Your hacks let you
build, but your system will not run.

-Steve
