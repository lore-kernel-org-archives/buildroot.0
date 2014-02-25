From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Feb 2014 21:06:05 +0100
Subject: [Buildroot] [PATCH] openswan: security bump to version 2.6.40
In-Reply-To: <1393352507-8841-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 25 Feb 2014 15:21:47 -0300")
References: <1393352507-8841-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bnxvj6tu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2013-6466.
 > openswan-wno-error-cpp.patch is no longer required since it's now
 > conditional on a check for a modern enough compiler.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
