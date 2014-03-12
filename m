From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Mar 2014 17:24:31 +0100
Subject: [Buildroot] [PATCH] device table dev: drop old CDROMs
In-Reply-To: <1394621923-25478-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 12 Mar 2014 07:58:43 -0300")
References: <1394621923-25478-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8738inpeps.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Drop old custom CDROM devices from the device table, these are x86-only
 > and really really old so it would be amazing these would be in working
 > order.
 > And they haven't been supported in linux for while.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
