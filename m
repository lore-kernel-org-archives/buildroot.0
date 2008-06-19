From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Jun 2008 09:01:39 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20080619003821.GB18139@cloud.net.au> (Hamish Moffatt's message
	of "Thu\, 19 Jun 2008 10\:38\:21 +1000")
References: <20080618154649.BB6FB3C6C1@busybox.net>
	<20080619003821.GB18139@cloud.net.au>
Message-ID: <877iclykks.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:

 Hamish> On Wed, Jun 18, 2008 at 08:46:49AM -0700, jacmet at uclibc.org wrote:
 >> Author: jacmet
 >> Date: 2008-06-18 08:46:48 -0700 (Wed, 18 Jun 2008)
 >> New Revision: 22430
 >> 
 >> Log:
 >> toolchain/gcc: use $(@D)

 Hamish> Umm that's not very descriptive :) What does $(@D) do and why is it
 Hamish> preferable to the previous value?

$(@D) is the directory part of the target, and it's preferable for the
same reason we are replacing explicit target names with $@.

Would you rather have a commit message like:

toolchain/gcc: misc cleanup ?

It's not really important, but I'm running though the changes Bernhard
has made to toolchain/gcc as I'm going to take the 4.3.x patches,
and I'm applying the trivial fixes I see.

-- 
Bye, Peter Korsgaard
