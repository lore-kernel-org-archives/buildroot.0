From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 22:03:33 +0200
Subject: [Buildroot] [PATCH] Makefile: help: BR2_DEFCONFIG for defconfig
 must be on command line
In-Reply-To: <20180722213445.29358-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Sun, 22 Jul 2018 23:34:45 +0200")
References: <20180722213445.29358-1-arnout@mind.be>
Message-ID: <87va8026lm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > The help text says that BR2_DEFCONFIG will be used as input, but a
 > BR2_DEFCONFIG specified in the existing .config file will *not* be
 > used. So say explicitly that it must be specified on the command line.
 > Note that both "BR2_DEFCONFIG=... make defconfig" and
 > "make defconfig BR2_DEFCONFIG=..." will work.

 > While we're at it, add a semicolon to separate the two statements.

 > Note that this overflows the help text beyond 80 characters, but that
 > is already the case in many other lines.

 > Reported-by: "aissen" on IRC
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
