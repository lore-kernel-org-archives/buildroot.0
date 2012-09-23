From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Sep 2012 20:24:50 +0200
Subject: [Buildroot] [PATCH] xapp_xkbcomp: fix cross compilation
In-Reply-To: <1348409310-13298-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Sun, 23 Sep 2012 15:08:30 +0100")
References: <1348409310-13298-1-git-send-email-spdawson@gmail.com>
Message-ID: <87zk4g8uml.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> The configure step of the xapp_xkbcomp package fails as follows.

 spdawson>   checking for ./xkbparse.c... configure: error: cannot check for file existence when cross compiling

 spdawson> This problem has been fixed by the following upstream commit.

 spdawson>   http://cgit.freedesktop.org/xorg/app/xkbcomp/commit/?id=cc55d8f5ab021861308b071aab9c03016be15187

Sorry, I fixed this already earlier today (f0b4b5a0686) in a simpler
way.

-- 
Bye, Peter Korsgaard
