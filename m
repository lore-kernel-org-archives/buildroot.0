From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 17 Jun 2008 11:11:12 +0200
Subject: [Buildroot] patches support gcc4.3
In-Reply-To: <873anctpxu.fsf@macbook.be.48ers.dk>
References: <1213690842.23450.9.camel@localhost>
	<873anctpxu.fsf@macbook.be.48ers.dk>
Message-ID: <20080617091112.GF25428@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 17, 2008 at 10:40:13AM +0200, Peter Korsgaard wrote:
>>>>>> "Luigi" == Luigi 'Comio' Mantellini <luigi.mantellini@idf-hit.com> writes:
>
> Luigi> Hi All, I'm new in this mailling list.  I'm trying to
> Luigi> understand the actual status of the gcc4.3 support into
> Luigi> buildroot (and soon). I'm working on a (ugly)coldfire 547x cpu
> Luigi> and gcc4.3 should (re) support my CPU.  Has anyone information
> Luigi> about the actual support status of gcc4.3 into buildroot?
>
>There's so far no gcc 4.3 support in buildroot, but I know Bernhard
>has gcc 4.3.0 support in his git tree. I might try to port it over
>next weekend and update it for 4.3.1.

The 4.3.0 patches should apply 1:1 against 4.3.1

I never tried a coldfire toolchain, so don't be surprised if something
doesn't work out of the box (with my tree). Please let me know if you
need help and we'll see what i can do.
