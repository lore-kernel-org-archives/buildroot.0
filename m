From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 May 2017 21:26:52 +0200
Subject: [Buildroot] [PATCH] gmp: Enable ASM for ARC again
In-Reply-To: <20170505123520.45502-1-abrodkin@synopsys.com> (Alexey Brodkin's
 message of "Fri, 5 May 2017 15:35:20 +0300")
References: <20170505123520.45502-1-abrodkin@synopsys.com>
Message-ID: <87mvarrtoj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

 > This commit reverts cdf63517de25 "gmp: disable assembly for arc"
 > as in GMP v6.1.2 there's already a proper fix for ASM constraints, see
 > https://gmplib.org/repo/gmp/rev/58879634af3ci

 > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
