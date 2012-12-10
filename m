From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Dec 2012 22:29:12 +0100
Subject: [Buildroot] [PATCH] openssl: fix runtime failure on some
	powerpc variants
In-Reply-To: <1354881980-24101-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 7 Dec 2012 09:06:20 -0300")
References: <1354881980-24101-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8738zdr3yv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> OpenSSL's assembly optimizations por PowerPC seem to be broken for at
 Gustavo> least 4xx cores.
 Gustavo> Thanks go to Jan Schunke for reporting and testing.

Committed, thanks.

-- 
Bye, Peter Korsgaard
