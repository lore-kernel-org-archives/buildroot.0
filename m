From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 Aug 2019 08:51:17 +0200
Subject: [Buildroot] [PATCH] package/strace: disable for riscv32
In-Reply-To: <a565abc48c0ed293fb0b1fffd6a847408f559528.1566707432.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 25 Aug 2019 07:30:32 +0300")
References: <a565abc48c0ed293fb0b1fffd6a847408f559528.1566707432.git.baruch@tkos.co.il>
Message-ID: <87ftlp4u1m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > strace does not support riscv32 yet.
 > https://lists.strace.io/pipermail/strace-devel/2019-August/009068.html

 > Fixes:
 > http://autobuild.buildroot.net/results/912776cc1da1719806058516a2cc2a47c8dbad9b/

 > Cc: Mark Corbin <mark.corbin@embecosm.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
