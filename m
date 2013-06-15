From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Jun 2013 21:49:11 +0200
Subject: [Buildroot] [PATCH] iozone: fixup build system
In-Reply-To: <1371233686-24012-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 14 Jun 2013 15:14:46 -0300")
References: <1371233686-24012-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k3lvyx1k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Fixup iozone's build system to make it somewhat more flexible.
 Gustavo> First make our own linux targets for non-AIO toolchains (uClibc) and
 Gustavo> non-threading.
 Gustavo> And second, just ditch forced largefile support and expect it from
 Gustavo> CFLAGS.
 Gustavo> Otherwise using the generic target caused issues like:
 Gustavo> http://autobuild.buildroot.net/results/19f606f2978dc3c8039b1bccfcc562b4050083c7/
 Gustavo> ...which is fixed by this.

Committed, thanks.

-- 
Bye, Peter Korsgaard
