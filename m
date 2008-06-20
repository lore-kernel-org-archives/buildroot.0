From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 20 Jun 2008 17:03:41 +0200
Subject: [Buildroot] cris
In-Reply-To: <87lk105gbw.fsf@macbook.be.48ers.dk>
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc> <485B6CF6.7040901@cetrtapot.si>
	<20080620125720.GE12682@mx.loc> <485BAFF8.8090604@cetrtapot.si>
	<20080620141152.GG12682@mx.loc>
	<87lk105gbw.fsf@macbook.be.48ers.dk>
Message-ID: <20080620150341.GH12682@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 20, 2008 at 04:30:43PM +0200, Peter Korsgaard wrote:
>>>>>> "Bernhard" == Bernhard Fischer <rep.dot.nop@gmail.com> writes:
>
>Hi,
>
> >> make[1]: Leaving directory `/work/stage/git.br/toolchain_build_cris/uClibc-0.9.29'
> >> make: *** [/home/hinkok/work/stage/git.br/toolchain_build_cris/uClibc-0.9.29/lib/libc.a] Error 2
>
> Bernhard> I don't see this. Is that uClibc-trunk or something else?
>
>I see that as well with uclibc 0.9.29.

Re the ptrace.h thing, it's a configuration problem on our side, but
it's not pretty to fix. Let's see, i think i have an idea how to do that
cleanly..
