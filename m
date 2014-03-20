From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Mar 2014 16:45:37 +0100
Subject: [Buildroot] [PATCH] mtools: fix target compilation
In-Reply-To: <1395226140-8086-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 19 Mar 2014 07:49:00 -0300")
References: <1395226140-8086-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bnx0x49q.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It needs some help regarding setpgrp, fixes:
 > http://autobuild.buildroot.net/results/33e/33e38bf1c30cc09dbe992dfb95c48997ca860212/
 > Also disable X11 support since it picks up the host variant.
 > And use normal indentation for variables.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
