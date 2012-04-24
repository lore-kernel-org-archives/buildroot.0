From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 24 Apr 2012 22:59:07 +0200
Subject: [Buildroot] [PATCH] python: enabled IPv6 socket support
In-Reply-To: <1335092596-16077-1-git-send-email-vsergeev@gmail.com> (Vanya
 Sergeev's message of "Sun, 22 Apr 2012 07:03:16 -0400")
References: <1335092596-16077-1-git-send-email-vsergeev@gmail.com>
Message-ID: <87haw8g82s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vanya" == Vanya Sergeev <vsergeev@gmail.com> writes:

 Vanya> From: vsergeev <vsergeev@gmail.com>

 Vanya> Modified python package Makefile to pass the configure option
 Vanya> for IPv6 socket support if BR2_INET_IPV6 is set. Added patch to
 Vanya> disable buggy_getaddrinfo test during configure when
 Vanya> cross-compiling.

Committed exept for the --enable-ipv6 part which is now handled
globally, thanks.

-- 
Bye, Peter Korsgaard
