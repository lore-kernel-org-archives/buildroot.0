From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Oct 2013 16:24:24 +0200
Subject: [Buildroot] [PATCHv2] toolchain-external: add a specific check
	to avoid Angstrom toolchains
In-Reply-To: <52600C75.5030503@mind.be> (Arnout Vandecappelle's message of
 "Thu, 17 Oct 2013 18:12:37 +0200")
References: <1381652900-12516-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <52600C75.5030503@mind.be>
Message-ID: <87zjq1bcyv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  Just for my info, how is it possible that we cannot use such an
 > Angstrom toolchain as an external toolchain, but it is possible to use
 > a buildroot-generated one? We can also generate a host dir with loads
 > of libs, and these are perfectly usable as external toolchain, right?

No, we can afaik only reuse a buildroot toolchain if it is "bare",
E.G. no packages selected.

-- 
Bye, Peter Korsgaard
