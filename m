From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 18 Jun 2014 23:59:10 +0200
Subject: [Buildroot] [PATCHv2 1/2] libnspr: security bump to version
	4.10.6
In-Reply-To: <1403102780-23666-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 18 Jun 2014 11:46:19 -0300")
References: <1403102780-23666-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ppi52829.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2014-1545 - Mozilla Netscape Portable Runtime (NSPR) before
 > 4.10.6 allows remote attackers to execute arbitrary code or cause a
 > denial of service (out-of-bounds write) via vectors involving the
 > sprintf and console functions.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
