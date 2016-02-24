From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 23:29:24 +0100
Subject: [Buildroot] [PATCH 1/2] qt: script & webkit depend on
	BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <1456316443-7087-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 24 Feb 2016 09:20:42 -0300")
References: <1456316443-7087-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k2ltzqrf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > They use __sync_add_and_fetch_4() and other 32-bit atomics, fixes:
 > http://autobuild.buildroot.net/results/7ac/7acdbc54e26ad2ba4756512614192be0a086f563/

 > Also remove sparc from supported architectures since it won't grow
 > atomics support magically.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
