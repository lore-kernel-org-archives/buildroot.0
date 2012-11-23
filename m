From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 23 Nov 2012 09:56:09 +0100
Subject: [Buildroot] [PATCH] arptables: needs mmu
In-Reply-To: <1353577595-23602-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 22 Nov 2012 06:46:35 -0300")
References: <1353577595-23602-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pq34g0k6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> arptables uses fork() and breaks on !mmu.
 Gustavo> Fixes
 Gustavo> http://autobuild.buildroot.net/results/fe18dd4a0b0d17404560abf3e4a332b58751f5cb/

Committed, thanks.

-- 
Bye, Peter Korsgaard
