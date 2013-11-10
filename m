From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Nov 2013 09:14:33 +0100
Subject: [Buildroot] [PATCH] mplayer: disable for anything lower than
	ARMv5
In-Reply-To: <1384030657-18543-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 9 Nov 2013 17:57:37 -0300")
References: <1384030657-18543-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87txfkekra.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Disable mplayer for anything lower than a v5 ARM core.
 > The support is broken and it's kind of pointless anyway. Fixes:
 > http://autobuild.buildroot.net/results/8f946e28b11b2ab1ba0d9688286c665488de0486/

Committed, thanks.

-- 
Bye, Peter Korsgaard
