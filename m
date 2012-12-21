From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Dec 2012 09:16:50 +0100
Subject: [Buildroot] [PATCH] toolchain-crosstool-ng: update PPL and
	CLoog versions in default configs
In-Reply-To: <1355959792-13804-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 20 Dec 2012 00:29:52 +0100")
References: <1355959792-13804-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ehijyg3x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> We have updated our Crosstool-NG configuration to gcc 4.6.x, but the
 Thomas> PPL and CLoog versions were not updated accordingly. With gcc 4.6.x,
 Thomas> at least PPL 0.11 is needed, and only CLoog > 0.15.9 can work with PLL
 Thomas> 0.11.

 Thomas> Fixes:

 Thomas>   http://autobuild.buildroot.org/results/c22758a30c3b8abb582150cefd7099605c527e14/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
