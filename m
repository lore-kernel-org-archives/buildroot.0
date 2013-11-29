From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 29 Nov 2013 10:01:53 +0100
Subject: [Buildroot] [PATCH] lua-ev: disable on avr32 and blackfin
In-Reply-To: <1385713114-3847-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 29 Nov 2013 08:18:34 +0000")
References: <1385713114-3847-1-git-send-email-spdawson@gmail.com>
Message-ID: <87siufwpha.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 > From: Simon Dawson <spdawson@gmail.com>
 > lua-ev is a reverse dependency of libev, but the architecture filtering is
 > not propagated. Fixes autobuild failure such as the following.

 >   http://autobuild.buildroot.net/results/387/38704a4362ab6c3458c45603975b274937059fa9/

 > Signed-off-by: Simon Dawson <spdawson@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
