From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Jan 2012 20:48:43 +0100
Subject: [Buildroot] [PATCHv2] toolchain: add powerpc SPE ABI support
In-Reply-To: <1325791903-26899-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 5 Jan 2012 16:31:43 -0300")
References: <1325791903-26899-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fwfrgup0.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add the ability for buildroot to build an SPE ABI enabled toolchain.
 Gustavo> This is mandatory for e500v1/v2 cores since they don't support classic
 Gustavo> FPU mode as the e500mc does.

 Gustavo> Useful for Freescale's PowerQUICC III and single/dual-core QorIQ
 Gustavo> line of processors.

Committed, thanks.

-- 
Bye, Peter Korsgaard
