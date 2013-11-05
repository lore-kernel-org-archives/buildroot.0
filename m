From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Nov 2013 09:02:30 +0100
Subject: [Buildroot] [PATCH v2] libsigsegv: fix avr32 build
In-Reply-To: <1383637409-8306-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Tue, 5 Nov 2013 07:43:29 +0000")
References: <1383637409-8306-1-git-send-email-spdawson@gmail.com>
Message-ID: <87iow7nund.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > The libsigsegv configure step fails to correctly figure out the direction of
 > stack growth for avr32. This leads to a zero STACK_DIRECTION definition, and
 > build failures such as the following.

 >   http://autobuild.buildroot.net/results/a3fe938f9376533b4777d79deb7a2ee83ed5ce33
 > Signed-off-by: Simon Dawson <spdawson@gmail.com>
 > ---
 >  v2: autoreconf, instead of patching configure, recommended by Peter
 > Korsgaard

Committed, thanks.

-- 
Bye, Peter Korsgaard
