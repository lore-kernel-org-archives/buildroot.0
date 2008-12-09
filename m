From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 9 Dec 2008 12:35:55 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
In-Reply-To: <20081209103324.GC12660@mx.loc>
References: <20081209100915.896263C6D4@busybox.net>
	<20081209102332.GB12660@mx.loc> <20081209113008.2698e098@hcegtvedt>
	<20081209103324.GC12660@mx.loc>
Message-ID: <20081209123555.44fa3e1c@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 9 Dec 2008 11:33:24 +0100
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:

> On Tue, Dec 09, 2008 at 11:30:08AM +0100, Hans-Christian Egtvedt
> wrote:
> >On Tue, 9 Dec 2008 11:23:32 +0100
> >Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> wrote:
> >
> >> On Tue, Dec 09, 2008 at 02:09:15AM -0800, egtvedt at uclibc.org wrote:
> >> >Author: egtvedt
> >> >Date: 2008-12-09 02:09:15 -0800 (Tue, 09 Dec 2008)
> >> >New Revision: 24343
> >> >
> >> >Log:
> >> >binutils: fix typo for detecting if BINUTILS_NO_MPFR is not set
> >> >
> >> >Make the ifndef check the actual variable, typo bug.
> >> 
> >> What are you trying to do or "fix"?
> >>
> >
> >So the ifndef is not supposed to look at the actual variable? Just
> >some text which happens to be exactly the same as a variable which
> >might be set above?
> 
> I suspect you're confusing "ifdef" with "ifeq", aren't you.
> Please look carefully at
> $ grep NO_MPFR toolchain/binutils/binutils.mk
> 

Argh, I was, sorry :( I'll revert the commit.

-- 
Best regards,
Hans-Christian Egtvedt
