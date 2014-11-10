From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Nov 2014 14:13:43 +0100
Subject: [Buildroot] [PATCH] gnutls: security bump to version 3.2.20
In-Reply-To: <1415623681-11218-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 10 Nov 2014 09:48:01 -0300")
References: <1415623681-11218-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k333nqpk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2014-8564 / GNUTLS-SA-2014-5 - Sean Burford reported that the
 > encoding of elliptic curves parameters GnuTLS 3 is vulnerable to a
 > denial of service (heap corruption). It affects clients and servers
 > which print information about the peer's certificate, e.g., the key ID,
 > and can be exploited via a specially crafted X.509 certificate.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
