From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 13:14:42 +0100
Subject: [Buildroot] [PATCH] libnss: security bump to version 3.22.2
In-Reply-To: <1457523680-18935-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 9 Mar 2016 08:41:20 -0300")
References: <1457523680-18935-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r3fj26h9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-1950 - heap-based buffer overflow related to the parsing of
 > certain ASN.1 structures. An attacker could create a specially-crafted
 > certificate which, when parsed by NSS, would cause a crash or execution
 > of arbitrary code with the permissions of the user.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
