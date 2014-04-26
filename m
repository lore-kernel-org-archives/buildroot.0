From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 26 Apr 2014 11:33:29 +0200
Subject: [Buildroot] [PATCH] gdb: not available on NIOS II
In-Reply-To: <1398455541-6213-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Fri, 25 Apr 2014 21:52:21 +0200")
References: <1398455541-6213-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <871twkzb86.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The mainline gdb does not have support for NIOS II, even just for
 > gdbserver.

 > Fixes:

 >   http://autobuild.buildroot.org/results/e57/e57aa016d6a73e59c404a7eb43c7bf5c16cbcbdc/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
