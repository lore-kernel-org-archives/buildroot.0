From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 15:13:54 +0100
Subject: [Buildroot] [PATCH] mtr: not available for avr32
In-Reply-To: <1391521393-19781-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 4 Feb 2014 10:43:13 -0300")
References: <1391521393-19781-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2j36k4d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The uclibc version condition is accurate but doesn't cover external
 > toolchains, so also exclude for avr32 too which only has 0.9.31 enabled.
 > Fixes:
 > http://autobuild.buildroot.net/results/4ee/4eec6e29d0f2a46bbbe3a748e85bd06c3601b7c1/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
