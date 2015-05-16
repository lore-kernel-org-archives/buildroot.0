From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 23:33:02 +0200
Subject: [Buildroot] [PATCH] package/heirloom-mailx: fix link issue with
	getopt
In-Reply-To: <1431811342-22781-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sat, 16 May 2015 23:22:22 +0200")
References: <1431811342-22781-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87pp608ay9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > With NIOS2 toolchain, heirloom-mailx fail to build
 > due to missing -fPIC when linking with its own getopt.

 > Since static build for heirloom-mailx is disabled,
 > always pass -fPIC in CFLAGS.

 > Fixes:
 > http://autobuild.buildroot.net/results/333/33346f4555ed403bab7b739dd5d47814efa8eb4c

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
