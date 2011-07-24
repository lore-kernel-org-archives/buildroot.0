From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Jul 2011 21:21:57 +0200
Subject: [Buildroot] [PATCH] iproute2: fixup CCOPTS to unbreak build
In-Reply-To: <1311348449-15782-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 22 Jul 2011 12:27:29 -0300")
References: <1311348449-15782-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pqkzwkkq.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> CCOPTS is also used for HOSTCC in the netem/ directory which contains
 Gustavo> host tools so just ditch it there to avoid extra non-native
 Gustavo> optimizations to sweep by.

Committed, thanks.

-- 
Bye, Peter Korsgaard
