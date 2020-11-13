From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2020 19:06:09 +0100
Subject: [Buildroot] [PATCH] toolchain/toolchain-buildroot: only riscv64
 is supported by uClibc-ng
In-Reply-To: <20201112232052.3137986-1-romain.naour@gmail.com> (Romain Naour's
 message of "Fri, 13 Nov 2020 00:20:52 +0100")
References: <20201112232052.3137986-1-romain.naour@gmail.com>
Message-ID: <875z69gmi6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > The commit [1] enabled riscv32 and riscv64 for uClibc-ng
 > internal toolchain backend but only riscv64 is curently
 > supported by uClibc-ng.

 > The initial patch [2] from Mark Corbin is only about riscv64.

 > Remove riscv32 from uClibc-ng supported architecture list.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981656

 > [1] 209a082478fca143394512bb9a6c0822f12cfe2c
 > [2] bd9810e176273914eca1208bcba23f0de9e446b3

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
