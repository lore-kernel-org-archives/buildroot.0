From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 11 Nov 2014 21:41:33 +0100
Subject: [Buildroot] [PATCH] nodejs: disable ssl2 and ssl3 when openssl
	is not built
In-Reply-To: <1415719263-11506-1-git-send-email-fabio.porcedda@gmail.com>
 (Fabio Porcedda's message of "Tue, 11 Nov 2014 16:21:03 +0100")
References: <1415719263-11506-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <87tx25mpvm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabio" == Fabio Porcedda <fabio.porcedda@gmail.com> writes:

 > The nodejs version 0.10.33 is compiled with SSLv2 and SSLv3 protocol
 > support by default so it fails to build if the package openssl was not
 > built.

 > To fix this build failure disable SSLv2 and SSLv3 protcol suppport if
 > the openssl package is not built.

 > Fixes:
 >   http://autobuild.buildroot.net/results/e1fb34818ff1167aa008b4011befb9fd14c81293
 >   http://autobuild.buildroot.net/results/8b72b0c311f2f7f7430aca5f7cca1f7d82d1c213
 >   http://autobuild.buildroot.net/results/e5f87dc635e0e6a6d1cc234529a433e12d810097
 >   http://autobuild.buildroot.net/results/3c4a5be556cfbd0d0e632757887ebc2f1de64bba

 > Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
