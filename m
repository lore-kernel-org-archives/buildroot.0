From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jul 2014 23:22:04 +0200
Subject: [Buildroot] [PATCH] toolchain/helpers.mk: don't discard
	check_arm_abi stderr
In-Reply-To: <2ffa51c027dd4f292dbaa1c0bc898100beda5695.1404405178.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 3 Jul 2014 19:32:58 +0300")
References: <2ffa51c027dd4f292dbaa1c0bc898100beda5695.1404405178.git.baruch@tkos.co.il>
Message-ID: <87vbrc4y6b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Since we are only need to know whether the compiler runs successfully, and
 > stderr is empty for the success case, there is no need to redirect stderr to
 > /dev/null. Moreover, stderr output of the failing case reveals valuable
 > information on the real failure reason.

 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
