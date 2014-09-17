From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Sep 2014 15:17:05 +0200
Subject: [Buildroot] [PATCH] dbus: security bump to version 1.8.8
In-Reply-To: <1410956319-29075-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 17 Sep 2014 09:18:39 -0300")
References: <1410956319-29075-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lhpi75f2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-3635 - Buffer access with incorrect length value
 > CVE-2014-3636 - Allocation of file descriptors or handles
 > without limits or throttling
 > CVE-2014-3637 - Missing release of file descriptor or handle after
 > effective lifetime
 > CVE-2014-3638 - Algorithmic complexity
 > CVE-2014-3639 - Allocation of file descriptors or handles without
 > limits or throttling

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
