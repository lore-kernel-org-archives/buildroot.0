From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 30 Oct 2012 20:11:20 +0100
Subject: [Buildroot] [PATCH] squid: fix kerberos build failure
In-Reply-To: <1351617681-4585-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 30 Oct 2012 14:21:21 -0300")
References: <1351617681-4585-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87mwz3hj1j.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The configure script tries to autodetect kerberos 5 support and seems to
 Gustavo> fail under some circumnstances.
 Gustavo> Just disable it since we don't have kerberos support in buildroot.
 Gustavo> Fixes:
 Gustavo> http://autobuild.buildroot.net/results/c9e590a1034c3869cb7391984ce8281ec4c3ef9c/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
