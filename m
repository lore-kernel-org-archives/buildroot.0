From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:25:26 +0200
Subject: [Buildroot] [PATCH 2/2] package/jamvm: restrict on what MIPS
 procs are allowed
In-Reply-To: <048871f6b7e29e9d485e8ba33e2bf374eac24bc4.1526207669.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 13 May 2018 12:34:38 +0200")
References: <cover.1526207669.git.yann.morin.1998@free.fr>
 <048871f6b7e29e9d485e8ba33e2bf374eac24bc4.1526207669.git.yann.morin.1998@free.fr>
Message-ID: <878t83yi09.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > jamvm uses deprecated opcodes to store/load words from the FPU
 > coprocessor registers, and in so doing, expects those registers
 > to be 32-bit.

 > Thus, restrict the conditions under which jamvm is available
 > under mips.

 > Fixes:
 >     http://autobuild.buildroot.org/results/f76/f76e10e4c1ce25b42fb2e5d2012adf2eaf1b2fe1/
 >     http://autobuild.buildroot.org/results/162/162d0e41dc9bc6d6f6594ccee0cb4217067fc71f/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
