From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 22:37:21 +0200
Subject: [Buildroot] [PATCH 5/8] toolchain: add SOCK_CLOEXEC and
	SOCK_NONBLOCK support to uclibc 0.9.31
In-Reply-To: <1302712169-28385-5-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 13 Apr 2011 13:29:26 -0300")
References: <1302712169-28385-1-git-send-email-gustavo@zacarias.com.ar>
	<1302712169-28385-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877hag3g1q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add SOCK_CLOEXEC and SOCK_NONBLOCK support to uclibc 0.9.31.
 Gustavo> Required for modern versions of udev.

Committed, thanks.

-- 
Bye, Peter Korsgaard
