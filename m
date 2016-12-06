From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Dec 2016 21:39:00 +0100
Subject: [Buildroot] [PATCH] toolchain-external: disallow sourcery
	codebench ARM toolchain for ARMv8 cores
In-Reply-To: <20161206164218.4488-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 6 Dec 2016 17:42:18 +0100")
References: <20161206164218.4488-1-peter@korsgaard.com>
Message-ID: <87r35kiyhn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > This toolchain uses GCC 4.8.x, which doesn't support the ARMv8 cores.
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
