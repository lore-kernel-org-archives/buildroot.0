From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Jun 2014 15:35:27 +0200
Subject: [Buildroot] [PATCHv2] bind: security bump to version 9.9.5
In-Reply-To: <1402395505-6937-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 10 Jun 2014 07:18:25 -0300")
References: <1402395505-6937-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mzslwf4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2014-0591 (a crafted query against an NSEC3-signed zone can
 > crash BIND).
 > The 9.9.x series is the new ESV vesion, 9.6.x has been retired.
 > Also cleanup the initscript while at it.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
