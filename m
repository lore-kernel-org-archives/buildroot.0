From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2015 22:09:17 +0100
Subject: [Buildroot] [PATCH] libnss: security bump to version 3.20.1
In-Reply-To: <1447073383-24351-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 9 Nov 2015 09:49:43 -0300")
References: <1447073383-24351-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87twousww2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-7181 - A use-after-poison flaw was found in the way NSS parsed
 > certain ASN.1 structures. An attacker could use this flaw to cause NSS
 > to crash or execute arbitrary code with the permissions of the user
 > running an application compiled against the NSS library.
 > CVE-2015-7182 - A heap-based buffer overflow flaw was found in the way
 > NSS parsed certain ASN.1 structures. An attacker could use this flaw to
 > cause NSS to crash or execute arbitrary code with the permissions of the
 > user running an application compiled against the NSS library.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
