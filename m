From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Dec 2012 23:41:07 +0100
Subject: [Buildroot] [PATCH 1/3] libgcrypt: disable tests
In-Reply-To: <1356530149-12305-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 26 Dec 2012 10:55:47 -0300")
References: <1356530149-12305-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zk105tdo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The testsuite uses fork() hence fails on !MMU targets.
 Gustavo> We don't use/install these so just get rid of them.

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
