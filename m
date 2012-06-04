From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Jun 2012 23:35:01 +0200
Subject: [Buildroot] [PATCH] quagga: fix non-IPv6 build failures
In-Reply-To: <1338654465-3145-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 2 Jun 2012 13:27:45 -0300")
References: <1338654465-3145-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lik2rcai.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The Zebra daemon now requires IPv6 support so disable it for
 Gustavo> non-IPv6 toolchains and add a comment mentioning it.  The
 Gustavo> BABEL protocol/daemon also requires IPv6 so just enable it
 Gustavo> when it's available.

Committed, thanks.

-- 
Bye, Peter Korsgaard
