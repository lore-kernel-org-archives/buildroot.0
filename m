From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 16 Dec 2012 11:10:33 +0100
Subject: [Buildroot] [PATCH] libnss: fix build failures
In-Reply-To: <1355232660-2377-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 11 Dec 2012 10:31:00 -0300")
References: <1355232660-2377-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8738z6fgti.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Such as
 Gustavo> http://autobuild.buildroot.net/results/2ca1d135269a67201e6b4d995ce8fbe94db1ed3f

 Gustavo> The mozilla build system passes all of the different ways of CFLAGS
 Gustavo> (OPTIMIZER, XCFLAGS, OS_CFLAGS) even when building host tools
 Gustavo> (nsintall).
 Gustavo> The best way around this without patching libnss is just building the
 Gustavo> host tools first without any CFLAGS and then going on with the rest.

Hmm, with this applied we still have autobuild failures:

http://autobuild.buildroot.net/results/299a132e7921aef044d121f910175cb9ddc7a04a/build-end.log

-- 
Bye, Peter Korsgaard
