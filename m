From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Jun 2012 22:16:45 +0200
Subject: [Buildroot] [PATCH 2/2] hiawatha: fix bug #5276 and bump to
	version 8.4
In-Reply-To: <1339447247-7801-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 11 Jun 2012 17:40:47 -0300")
References: <1339447247-7801-1-git-send-email-gustavo@zacarias.com.ar>
 <1339447247-7801-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r4tfgggi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fix bug #5276 by disabling IPv6 when the toolchain lacks it.
 Gustavo> It builds fine even if it's enabled but it probably doesn't work fine.

 Gustavo> Also bump to version 8.4:
 Gustavo> * MaxServerLoad option added.
 Gustavo> * Bugfix: invalid reverse proxy request when URL parameters are present.
 Gustavo> * PolarSSL updated to version 1.1.4.
 Gustavo> * Small bugfixes and improvements.

Committed, thanks.

-- 
Bye, Peter Korsgaard
