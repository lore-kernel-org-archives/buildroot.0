From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 May 2011 21:15:32 +0200
Subject: [Buildroot] [PATCH] bind: security bump to version 9.6-ESV-R4
In-Reply-To: <1304447622-6874-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 3 May 2011 15:33:42 -0300")
References: <1304447622-6874-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87liynmw8b.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump bind to version 9.6-ESV-R4 since the 9.5 series is no longer
 Gustavo> supported.

 Gustavo> While at it switch to the ESV (Extended Support Version)
 Gustavo> branch instead of going for the latest.

 Gustavo> Also adjust the package to build against OpenSSL when available for
 Gustavo> proper DNSSEC support and libxml2 too.

Committed, thanks.

-- 
Bye, Peter Korsgaard
