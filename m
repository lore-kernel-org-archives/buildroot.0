From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 11:17:25 +0100
Subject: [Buildroot] [PATCH 2/2] ltp-testsuite: drop redundant arch
 dependency entries
In-Reply-To: <2f61c63d53f8ba4ea0b65942b57f67a156fbf778.1516964598.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 26 Jan 2018 13:03:18 +0200")
References: <944db376505dab7095cf32949160c0d024d92926.1516964598.git.baruch@tkos.co.il>
 <2f61c63d53f8ba4ea0b65942b57f67a156fbf778.1516964598.git.baruch@tkos.co.il>
Message-ID: <87po5vhah6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > BR2_TOOLCHAIN_HAS_SYNC_4 is enabled for all these architectures except
 > arc. There is no need to list them explicitly.

 > Cc: Romain Naour <romain.naour@gmail.com>
 > Cc: Petr Vorel <petr.vorel@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
