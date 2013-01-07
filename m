From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 07 Jan 2013 23:32:56 +0100
Subject: [Buildroot] [pull request] Pull request for branch perf-elfutils
In-Reply-To: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 6 Jan 2013 16:22:40 +0100")
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ip78bp47.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a set of patches that add the elfutils and perf packages in
 Thomas> Buildroot, based on previous efforts from Stefan Fr?berg and Kaiwan
 Thomas> Billimoria (thanks !).

 Thomas> These packages are not trivial because:
 Thomas>  1) perf is part of the kernel sources
 Thomas>  2) elfutils is a nightmare to build against uClibc

 Thomas> I've been working on this for about two days, trying different
 Thomas> solutions, the one proposed here appeared to be the most reasonable
 Thomas> one in terms of patch size, and maintenability.

Thanks everyone, committed series.

Thomas, please don't forget to (try to) send these patches upstream so
we don't have to maintain them ourselves in the future.

-- 
Bye, Peter Korsgaard
