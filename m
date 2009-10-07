From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 7 Oct 2009 23:22:14 +0200
Subject: [Buildroot] [PATCH 06/14] allow for testing gcc-4.5
In-Reply-To: <87ws36j4vz.fsf@macbook.be.48ers.dk>
References: <4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<a576ef52cd1f156525fd2d327f1e7da466257be2.1254945750.git.rep.dot.nop@gmail.com>
	<df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
	<cover.1254945750.git.rep.dot.nop@gmail.com>
	<382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
	<87vdirj6k6.fsf@macbook.be.48ers.dk>
	<20091007203323.GF23847@mx.loc>
	<87ws36j4vz.fsf@macbook.be.48ers.dk>
Message-ID: <20091007212214.GL23847@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 07, 2009 at 11:00:48PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
>
> Bernhard> On Wed, Oct 07, 2009 at 10:24:41PM +0200, Peter Korsgaard wrote:
> >>>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:
> >> 
> Bernhard> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> Bernhard> ---
> Bernhard> toolchain/gcc/Config.in |   12 ++++++------
> >> 
> >> No uclibc-specific patches?
>
> Bernhard> you don't even default to 4.4.1 IIRC, so no not at this time.
>
>No, because of reported C++ issues. Does 4.5(-pre) even build for uclibc
>without minimal patches?

builds fine for the few arches i tried.
If there are C++ issues in 4.4.x then they should be fixed or at least
be reported.
