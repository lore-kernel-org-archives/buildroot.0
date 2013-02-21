From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Feb 2013 15:18:17 +0100
Subject: [Buildroot] [PATCH] Revert "uClibc: port linuxthreads errno
	patch to 0.9.33.2"
In-Reply-To: <1361455787-4846-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 21 Feb 2013 11:09:47 -0300")
References: <1361455787-4846-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877gm1hhsm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> This reverts commit 1d8c3e6caf6be14644ef8ef5ae2704105322442b
 Gustavo> The forward port breaks compilation at least for SPARC NPTL
 Gustavo> toolchains:

Committed, thanks.

-- 
Bye, Peter Korsgaard
