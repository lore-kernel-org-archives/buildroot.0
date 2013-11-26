From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Nov 2013 12:41:05 +0100
Subject: [Buildroot] [PATCH] poco: fix sh4a fenv build failure
In-Reply-To: <5d2e8438f0988fd083d58c8ecebce26a47eb26e4.1385398048.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 25 Nov 2013 18:47:28 +0200")
References: <5d2e8438f0988fd083d58c8ecebce26a47eb26e4.1385398048.git.baruch@tkos.co.il>
Message-ID: <87zjorjsq6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Disable FP environment on sh4a. Fixes
 > http://autobuild.buildroot.net/results/8dc9bca5969d455cc30206fc1ae6e1d3ba6eb6ca/.

Committed, thanks.

-- 
Bye, Peter Korsgaard
