From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Apr 2013 09:30:16 +0200
Subject: [Buildroot] [PATCH 1/4] toolchain/arm: drop generic and old,
	add fa526/626, unify strongarm
In-Reply-To: <1365096588-1932-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 4 Apr 2013 14:29:45 -0300")
References: <1365096588-1932-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874nfdy16f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> * Add Faraday FA526/626 as suggested on bug #1291
 Gustavo> Note however that these cores are v4 and NOT v4t.

 Gustavo> * Make the sa110 & sa1110 cores -> strongarm since they're the same.

 Gustavo> * Drop all of the ARM variants lower than v4 including generic, there's
 Gustavo> no point in supporting obsolete targets.

 Gustavo> * Fix uClibc USE_BX logic, it was always on, this would break the new
 Gustavo> FA526/626 support and broke StrongARM since it's a v4 core.

Committed all 4, thanks!

-- 
Bye, Peter Korsgaard
