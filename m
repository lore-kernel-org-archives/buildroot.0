From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 18 Jun 2008 09:10:56 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
In-Reply-To: <87fxrbj406.fsf@macbook.be.48ers.dk>
References: <20080617133035.AC6F63C786@busybox.net>
	<20080617155338.GI27792@mx.loc>
	<87fxrbj406.fsf@macbook.be.48ers.dk>
Message-ID: <20080618071056.GA32192@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 17, 2008 at 08:44:09PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:
>
> Bernhard> On Tue, Jun 17, 2008 at 06:30:35AM -0700, jacmet at uclibc.org wrote:
> >> Author: jacmet
> >> Date: 2008-06-17 06:30:35 -0700 (Tue, 17 Jun 2008)
> >> New Revision: 22401
> >> 
> >> Log:
> >> toolchain/uclibc: strip libpthread
>
> Bernhard> Those are options in uclibc-menuconfig.
>
>Sorry, I don't see it. Do you mean CONFIG_PTHREADS_DEBUG_SUPPORT?

no. DOSTRIP
