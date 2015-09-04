From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 04 Sep 2015 16:07:48 +0200
Subject: [Buildroot] [PATCH] bind: security bump to version 9.9.7-P3
In-Reply-To: <1441370392-9334-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 4 Sep 2015 09:39:52 -0300")
References: <1441370392-9334-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87egiemg5n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-5722 - denial-of-service vector which can be exploited remotely
 > against a BIND server that is performing validation on DNSSEC-signed
 > records.
 > CVE-2015-5986 - denial-of-service vector which can be used against a
 > BIND server that is performing recursion and (under limited conditions)
 > an authoritative-only nameserver.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
