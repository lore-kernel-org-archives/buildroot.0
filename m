From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Sep 2016 07:29:38 +0200
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.2j
In-Reply-To: <1474933495-2967-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 26 Sep 2016 20:44:55 -0300")
References: <1474933495-2967-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a8et3o71.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-6309 - Fix Use After Free for large message sizes
 > CVE-2016-7052 - Missing CRL sanity check

Committed after removing the 6309 CVE reference as pointed out by
Baruch, thanks.

-- 
Bye, Peter Korsgaard
