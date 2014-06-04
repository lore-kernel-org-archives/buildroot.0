From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Jun 2014 12:35:31 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: fix quota parallel build issue
In-Reply-To: <1401877280-5156-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 4 Jun 2014 07:21:20 -0300")
References: <1401877280-5156-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tx81otcc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Missing quota.o dependencies, patch already upstream. Fixes:
 > http://autobuild.buildroot.net/results/aac/aac7b4e3becfc0db5e50ff45d28376f35a9131af/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
