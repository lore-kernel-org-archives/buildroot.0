From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 16 Nov 2012 00:29:10 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain/gdb: disable support of full
	gdb on target for blackfin
In-Reply-To: <1352586536-19621-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 10 Nov 2012 23:28:55 +0100")
References: <1352586536-19621-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87obiyzbqx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> There is no support in gdb 6.6 for the Blackfin architecture, so
 Thomas> disallow this choice. This fixes the following build failure:

 Thomas>   http://autobuild.buildroot.org/results/e37db29810265a756833da163fda444d967d7874/build-end.log

Committed both, thanks.

-- 
Bye, Peter Korsgaard
