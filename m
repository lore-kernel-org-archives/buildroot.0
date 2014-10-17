From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Oct 2014 11:32:22 +0200
Subject: [Buildroot] [PATCH] openssl: security bump to version 1.0.1j
In-Reply-To: <1413464267-4698-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 16 Oct 2014 09:57:47 -0300")
References: <1413464267-4698-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oatbf3dl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-3513 - SRTP memory leak
 > CVE-2014-3567 - Session ticket memory leak
 > CVE-2014-3568 - Build option no-ssl3 is incomplete
 > And adds SSL3 fallback protection against POODLE.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
