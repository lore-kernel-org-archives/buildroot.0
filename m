From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jan 2014 17:34:23 +0100
Subject: [Buildroot] [PATCH] rtmpdump: fix build with selected crypto
In-Reply-To: <1390663608-1481-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sat, 25 Jan 2014 16:26:48 +0100")
References: <1390663608-1481-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87y521o034.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > After the patch 42ed108013082c6836673aabe8d6258f9e7a490f, the defaut
 > crypto engine became GNUTLS, this made the build failed as the CFLAGS
 > variable where not correctly passed to the Makefile.

Thanks, but I took a closer look at the makefile and rewrote rtmpdump.mk
to use XCFLAGS / XLDFLAGS instead.

-- 
Bye, Peter Korsgaard
