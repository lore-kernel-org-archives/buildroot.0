From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Feb 2014 15:54:22 +0100
Subject: [Buildroot] [PATCH 3/3] mplayer: add missing reverse
	dependencies for bfin and sh2a
In-Reply-To: <1392803602-5566-4-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Wed, 19 Feb 2014 10:53:22 +0100")
References: <1392803602-5566-1-git-send-email-fabio.porcedda@gmail.com>
 <1392803602-5566-4-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87ha7v17c1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > Propagate to comment and libplayer unsupported platforms bfin and sh2a.
 > Fixes:
 > http://autobuild.buildroot.net/results/5d8/5d80ade791319b6a66ac1c342f7b1d25c023f0af/

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

s/bfin/nios2/

Committed, thanks.

-- 
Bye, Peter Korsgaard
