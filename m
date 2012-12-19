From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Dec 2012 15:13:05 +0100
Subject: [Buildroot] [PATCH] libcap: disable programs
In-Reply-To: <1355150584-31592-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 10 Dec 2012 11:43:04 -0300")
References: <1355150584-31592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878v8u3zbi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Disable libcap programs since they use fork and fail on !MMU systems.
 Gustavo> They're not usually used, if someone wants them they can add
 Gustavo> an option.

Committed, thanks.

-- 
Bye, Peter Korsgaard
