From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 08:49:29 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
In-Reply-To: <20080330233915.GA22016@cloud.net.au> (Hamish Moffatt's message
	of "Mon\, 31 Mar 2008 10\:39\:15 +1100")
References: <20080329231048.1533A3C48B@busybox.net>
	<87wsnk2wkz.fsf@macbook.be.48ers.dk>
	<20080330233915.GA22016@cloud.net.au>
Message-ID: <87k5jjxu9y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

 Hamish> On Sun, Mar 30, 2008 at 03:03:08PM +0200, Peter Korsgaard wrote:
 >> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
 >> 
 ulf> Author: ulf
 ulf> Date: 2008-03-29 16:10:47 -0700 (Sat, 29 Mar 2008)
 ulf> New Revision: 21568
 >> 
 ulf> Log:
 ulf> Force use of bash for patching
 >> 
 ulf> Modified:
 ulf> trunk/buildroot/toolchain/patch-kernel.sh
 >> 
 >> Please close the bug report (2674) as well.

 Hamish> It would be better to make patch-kernel.sh work with a posix
 Hamish> shell (eg dash) rather than forcing bash.

Sure - You had a look at it already, didn't you? You are welcome to
fix it.

-- 
Bye, Peter Korsgaard
