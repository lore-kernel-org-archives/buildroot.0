From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 29 Nov 2011 15:41:12 +0100
Subject: [Buildroot] kernel-headers toolchain
In-Reply-To: <1322570217.86473.YahooMailNeo@web161202.mail.bf1.yahoo.com> (Tim
 Judd's message of "Tue, 29 Nov 2011 04:36:57 -0800 (PST)")
References: <1322539787.53021.YahooMailNeo@web161203.mail.bf1.yahoo.com>
 <87ty5ns54t.fsf@macbook.be.48ers.dk>
 <1322570217.86473.YahooMailNeo@web161202.mail.bf1.yahoo.com>
Message-ID: <87liqzrnxz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Tim" == Tim Judd <tjudd2k@yahoo.com> writes:

 Tim> Thanks for the replies.

 Tim> If I have to keep the OEM kernel, wouldn't it be better to remove
 Tim> the function/ rename the function in uclibc/glibc instead?  since
 Tim> the older kernel had that function defined?

In general yes - But this is not a function of the kernel, but of a
helper program used by the kernels' build system - So changing the
function doesn't affect the running kernel.

-- 
Bye, Peter Korsgaard
