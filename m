From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Dec 2013 09:29:48 +0100
Subject: [Buildroot] [PATCH] dvb-apps: fix avr32 build failure
In-Reply-To: <1386927763-22339-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 13 Dec 2013 09:42:43 +0000")
References: <1386927763-22339-1-git-send-email-spdawson@gmail.com>
Message-ID: <87y53mwm83.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > When building for avr32, the build fails as follows.

 >   cc1: error: unrecognized command line option "-Wno-packed-bitfield-compat"

 > An example of an autobuild failure arising from this is the following.

 >   http://autobuild.buildroot.net/results/92e/92e472004812a3616f62d766a9ea07a997a66e89/

 > Clearly, not all toolchains provide a gcc that understands
 > the -Wno-packed-bitfield-compat flag; remove usage of this flag.

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
