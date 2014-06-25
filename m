From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Jun 2014 22:30:24 +0200
Subject: [Buildroot] [PATCH] gnupg: security bump to version 1.4.17
In-Reply-To: <1403721714-14795-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 25 Jun 2014 15:41:54 -0300")
References: <1403721714-14795-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mz8ybof.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2014-4617: The do_uncompress function in g10/compress.c in
 > GnuPG 1.x before 1.4.17 and 2.x before 2.0.24 allows context-dependent
 > attackers to cause a denial of service (infinite loop) via malformed
 > compressed packets, as demonstrated by an a3 01 5b ff byte sequence.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
