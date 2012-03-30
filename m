From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Mar 2012 13:50:18 +0200
Subject: [Buildroot] [PATCH] sudo: add fix for non-utmpx toolchains
In-Reply-To: <1333103753-29248-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 30 Mar 2012 07:35:53 -0300")
References: <1333103753-29248-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bonee29x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> The utmpx defines for when the target systems lacks utmpx is incomplete,
 Gustavo> resulting in a build failure, so fix it.
 Gustavo> This can be triggered by a uClibc toolchain that lacks UTMPX in the
 Gustavo> configuration, or an older (<= 0.9.31) uClibc which lacks the
 Gustavo> functionality.

Committed, thanks.

Don't forget to send it upsteam as well.

-- 
Bye, Peter Korsgaard
