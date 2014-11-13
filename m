From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Nov 2014 16:29:01 +0100
Subject: [Buildroot] [PATCH] libmemcached: disable sanitizer
In-Reply-To: <1415877117-20736-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 13 Nov 2014 08:11:57 -0300")
References: <1415877117-20736-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r3x7i0g2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The tests are flawed and we don't generally enable a dozen hardening
 > CFLAGS automatically. Fixes:
 > http://autobuild.buildroot.net/results/a84/a84ab4f0fdea6bbab971ba379e3066cddb25bfaa/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
