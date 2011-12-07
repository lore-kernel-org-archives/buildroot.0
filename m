From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Dec 2011 22:16:04 +0100
Subject: [Buildroot] [PATCH 1/2] uClibc: add unshare() syscall support
In-Reply-To: <1323090042-3435-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 5 Dec 2011 10:00:41 -0300")
References: <1323090042-3435-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fwgwaxrf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add unshare() syscall support for uClibc 0.9.31 and 0.9.32 series.
 Gustavo> This is required by newer versions of iproute2.

Committed, thanks.

-- 
Bye, Peter Korsgaard
