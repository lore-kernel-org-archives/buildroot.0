From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Dec 2013 09:06:17 +0100
Subject: [Buildroot] [PATCH] gnutls: revert bump
In-Reply-To: <1386088080-4286-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 3 Dec 2013 13:28:00 -0300")
References: <1386088080-4286-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87vbz5m45i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Revert bump to 3.2.7 from commit 8238e744b813e9922c0a81f21b271263ef0e216a
 > It causes build issues because of an internal gnulib bump:
 > http://autobuild.buildroot.net/results/48d/48d5c6364fec55e84309b2fb6986f206699f1800/

Committed, thanks.

-- 
Bye, Peter Korsgaard
