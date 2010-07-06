From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jul 2010 08:02:29 +0200
Subject: [Buildroot] [pull request] Pull request for branch
	ext-toolchain-fixes
In-Reply-To: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Mon, 5 Jul 2010 18:58:53 +0200")
References: <cover.1278349072.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87wrt96tca.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a new version of my ext-toolchain-fixes branch, which fixes
 Thomas> the problem noted by Peter on the sysroot detection code.

 Thomas> We switch to --sysroot=/path/to instead of --sysroot /path/to, which
 Thomas> eases the filtering of this option, which is needed to find out the
 Thomas> original location of the toolchain sysroot.

Committed, thanks!

-- 
Bye, Peter Korsgaard
