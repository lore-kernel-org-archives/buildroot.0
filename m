From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Jul 2014 16:59:09 +0200
Subject: [Buildroot] [PATCHv2] atftp: fix static linking
In-Reply-To: <1405000763-16608-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 10 Jul 2014 10:59:23 -0300")
References: <1405000763-16608-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k37lnttu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Readline uses ncurses hence pull it in, also needs to explicitly link
 > against libpthread. Fixes:
 > http://autobuild.buildroot.net/results/259/2592612be38a2c1dde21b44be2ecf25d1cc5211a/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
