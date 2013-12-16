From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Dec 2013 12:37:05 +0100
Subject: [Buildroot] [PATCH v2] oprofile: fix install for avr32
In-Reply-To: <1387183417-23816-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 16 Dec 2013 08:43:37 +0000")
References: <1387183417-23816-1-git-send-email-spdawson@gmail.com>
Message-ID: <87k3f5rpr2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > There is no perf_events support in the kernel for avr32. The oprofile
 > package makefile hard codes the list of binaries to install. Unfortunately,
 > this hard-coded list contains pe_profiling/operf, which is only built when
 > perf_events support is available.

 > Fixes autobuild failures such as the following.

 >   http://autobuild.buildroot.net/results/492/492659bc252395a62e62e6005ed0e86e582dcada/

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>
 > ---
 >  v2: Remove unintended OPROFILE_MAKE modification, spotted by Baruch Siach

Committed, thanks.

-- 
Bye, Peter Korsgaard
