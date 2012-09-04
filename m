From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Sep 2012 22:04:19 +0200
Subject: [Buildroot] [pull request v3] Pull request for branch
	update-mips-support
In-Reply-To: <cover.1346767632.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 4 Sep 2012 16:09:52 +0200")
References: <cover.1346767632.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87d3215zcs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Here is a new version of the patch set that clarifies MIPS support,
 Thomas> and especially MIPS64 support.

 Thomas> It has four patches:

 Thomas>  * First patch refactors some uclibc.mk to use the existing BR2_ENDIAN
 Thomas>    config option rather than doing the same work again.

 Thomas>  * Second patch reworks the config option for mips. It creates two
 Thomas>    separate two level architectures for MIPS and MIPS64, and then
 Thomas>    clarifies the ABI names and config options.

 Thomas>  * Third patch (from Gustavo) remove old MIPS64 related toolchain
 Thomas>    kludge

 Thomas>  * Fourth patch (from Gustavo) adds a defconfig to build a mips64
 Thomas>    system for Qemu

Committed, thanks.

-- 
Bye, Peter Korsgaard
